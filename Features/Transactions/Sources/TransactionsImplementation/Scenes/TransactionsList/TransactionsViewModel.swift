import Combine
import PBCore
import SwiftUI
import TransactionsAPI

// MARK: - TransactionsViewModel

final class TransactionsViewModel: ObservableObject {

    // MARK: Lifecycle

    init(transactionsService: TransactionsService) {
        self.transactionsService = transactionsService
    }

    // MARK: Internal

    enum State: Equatable {
        case idle
        case loading
        case transactions([PBTransaction])
        case error
    }

    @Published private(set) var transactions: [PBTransaction] = []
    @Published private(set) var state: TransactionsViewModel.State = .idle
    @Published private(set) var categories: [Category] = []
    @Published var hasError = false
    var cachedTransactios: [PBTransaction] = []
    @Published var isFiltered = false

    @Published var searchText = "" {
        didSet {
            filterTransactions()
        }
    }

    @Published var selectedCategory: Category? {
        didSet {
            filterTransactions()
        }
    }

    func fetchTransactions() async {
        if state == .loading { return }

        do {
            await MainActor.run {
                state = .loading
            }
            let items = try await transactionsService.fetchTansactions()
            let sortedTransactions = sort(transactions: items)
            let sortedCategories = extractCategories(from: items)

            await MainActor.run {
                state = .transactions(sortedTransactions)
                categories = sortedCategories
                cachedTransactios = sortedTransactions
                hasError = false
            }

        } catch {
            await MainActor.run {
                hasError = true
                state = .error
            }
        }
    }

    func refreshTransactions() async {
        do {
            let items = try await transactionsService.fetchTansactions()
            let sortedTransactions = sort(transactions: items)
            let sortedCategories = extractCategories(from: items)

            await MainActor.run {
                categories = sortedCategories
                cachedTransactios = sortedTransactions
                hasError = false
                filterTransactions()
            }

        } catch {
            await MainActor.run {
                hasError = true
                state = .error
            }
        }
    }

    func filterTransactions() {
        var result = cachedTransactios

        result = result
            .apply(filter: selectedCategory)
            .apply(filter: searchText)

        state = .transactions(result)
        isFiltered = !searchText.isEmpty || selectedCategory != nil
    }

    func select(category item: Category) {
        guard let selectedCategory, selectedCategory == item else {
            self.selectedCategory = item
            return
        }

        if selectedCategory.value == item.value {
            self.selectedCategory = nil
        }
    }

    // MARK: Private

    private let transactionsService: TransactionsService

    private func sort(transactions items: [PBTransaction]) -> [PBTransaction] {
        items.sorted(by: { lhs, rhs in
            lhs.transactionDetail.bookingDate > rhs.transactionDetail.bookingDate
        })
    }

    private func extractCategories(from items: [PBTransaction]) -> [Category] {
        items
            .unique { $0.category }
            .map { Category(id: $0.category, title: "Category: \($0.category)", value: $0.category) }
            .sorted { $0.value < $1.value }
    }
}


// MARK: - TransactionsReducer

final class TransactionsReducer: Reducer {

    // MARK: Lifecycle

    init(transactionsService: TransactionsService) {
        self.transactionsService = transactionsService
    }

    // MARK: Internal

    enum Action: Sendable {
        case fetchTransactions
        case refreshTRansactions

        case set([PBTransaction], [Category])
        case setTransactions([PBTransaction])
        case setFiltered(Bool)
        case applyFilters
        case setError
        case none
    }

    struct State: Sendable, Equatable {
        var transactions: [PBTransaction]
        var cachedTransactios: [PBTransaction]
        var categories: [Category]
        var selectedCategory: Category?
        var searchText = ""
        var hasError: Bool
        var isFiltered = false
    }

    func reduce(state: inout State, action: Action) -> AnyEffect<Action> {
        switch action {
        case .fetchTransactions:
            return .single { [weak self] in
                guard let self else { return .none }
                return await fetchTransactions()
            }
        case .refreshTRansactions:
            return .concat(
                .single { [weak self] in
                    guard let self else { return .none }
                    return await fetchTransactions()
                },
                .just(.applyFilters))
        case .set(let transactions, let categories):
            state.categories = categories
            state.transactions = transactions
            state.cachedTransactios = transactions
            return .none
        case .setError:
            state.hasError = true
            return .none
        case .applyFilters:
            var result = state.cachedTransactios
            result = result
                .apply(filter: state.selectedCategory)
                .apply(filter: state.searchText)
            let isFiltered = !state.searchText.isEmpty || state.selectedCategory != nil
            return .concat(
                .just(.setTransactions(result)),
                .just(.setFiltered(isFiltered)))
        case .setTransactions(let transactions):
            state.transactions = transactions
            return .none
        case .setFiltered(let isFiltered):
            state.isFiltered = isFiltered
            return .none
        case .none:
            return .none
        }
    }

    // MARK: Private


    private let transactionsService: TransactionsService
    private func fetchTransactions() async -> Action {
        do {
            let response = try await transactionsService.fetchTansactions()
            let transactions = sort(transactions: response)
            let categories = extractCategories(from: response)

            return .set(transactions, categories)
        } catch {
            return .setError
        }
    }

    private func sort(transactions items: [PBTransaction]) -> [PBTransaction] {
        items.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })
    }

    private func extractCategories(from items: [PBTransaction]) -> [Category] {
        items
            .unique { $0.category }
            .map { Category(id: $0.category, title: "Category: \($0.category)", value: $0.category) }
            .sorted { $0.value < $1.value }
    }
}
