import PBCore
import PBUI
import SwiftUI

// MARK: - TransactionsListScene

struct TransactionsListScene: View {

    // MARK: Lifecycle

    init(viewModel: TransactionsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
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
                        transactions: items), isFiltered: $viewModel.isFiltered)
            case .error:
                EmptyList(viewModel: .init(title: ""))
            }
        }
        .overlay(isPresented: $viewModel.hasError) {
            Toast(viewModel: .init(title: "Error", description: "Something went wrong", actionTitle: "Retry")) {
                Task {
                    await viewModel.fetchTransactions()
                }
            }
        }
        .toolbar {
            ToolbarItem {
                CategoryMenu(
                    viewModel: .init(categories: viewModel.categories),
                    selectedCategory: $viewModel.selectedCategory) {
                        viewModel.select(category: $0)
                    }
            }
        }
        .tint(Color.Accents.accent2)
        .navigationTitle(Localized.title)
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .task {
            await viewModel.fetchTransactions()
        }
        .refreshable {
            Task {
                await viewModel.refreshTransactions()
            }
        }
    }

    // MARK: Private

    @StateObject
    private var viewModel: TransactionsViewModel
}

// MARK: TransactionsListScene.Localized

extension TransactionsListScene {
    fileprivate enum Localized {
        static let title = "Transactions List"
        static let emptyMessage = "We couldn't find any matches for your search"
    }
}
