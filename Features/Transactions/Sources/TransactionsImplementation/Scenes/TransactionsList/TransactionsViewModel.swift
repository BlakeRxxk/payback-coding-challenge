import Combine
import PBCore
import SwiftUI
import TransactionsAPI

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

        result = apply(filter: selectedCategory, for: result)
        result = apply(filter: searchText, for: result)

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

    private func apply(filter category: Category?, for items: [PBTransaction]) -> [PBTransaction] {
        if let category {
            items.filter { $0.category == category.value }
        } else {
            items
        }
    }

    private func apply(filter searchText: String, for items: [PBTransaction]) -> [PBTransaction] {
        if !searchText.isEmpty {
            items.filter {
                FuzzyMatching.search(for: searchText, in: $0.partnerDisplayName)
            }
        } else {
            items
        }
    }

}
