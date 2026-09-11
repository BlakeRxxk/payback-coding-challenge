import Core
import DesignSystem
import SwiftUI
import TransactionsAPI

// MARK: - TransactionsListScene

struct TransactionsListScene: View {

    // MARK: Lifecycle

    init(viewModel: TransactionsViewModel, onSelect: @escaping (PaymentTransaction) -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSelect = onSelect
    }

    // MARK: Internal

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle: EmptyList(viewModel: .init(title: ""))

            case .loading: LoadingList()

            case .transactions(let items):
                TransactionsList(
                    viewModel:
                    .init(
                        emptyState: Localized.emptyMessage,
                        transactions: items),
                    isFiltered: $viewModel.isFiltered)
                { transaction in
                    onSelect(transaction)
                }

            case .error:
                EmptyList(viewModel: .init(title: ""))
            }
        }
        .toolbar {
            ToolbarItem {
                CategoryMenu(
                    viewModel: .init(categories: viewModel.categories),
                    selectedCategory: $viewModel.selectedCategory)
                {
                    viewModel.select(category: $0)
                }
            }
        }
        .tint(Color.Accents.accent2)
        .navigationTitle(Localized.title)
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .refreshable {
            Task {
                await viewModel.refreshTransactions()
            }
        }
    }

    // MARK: Private

    @StateObject private var viewModel: TransactionsViewModel

    private let onSelect: (PaymentTransaction) -> Void
}

// MARK: TransactionsListScene.Localized

extension TransactionsListScene {
    fileprivate enum Localized {
        static let title = "Transactions List"
        static let emptyMessage = "We couldn't find any matches for your search"
    }
}
