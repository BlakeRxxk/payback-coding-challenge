import Foundation
import SwiftUI
import TransactionsAPI

// MARK: - TransactionsList

struct TransactionsList: View {

    // MARK: Lifecycle

    init(viewModel: TransactionsList.ViewModel, isFiltered: Binding<Bool>, onSelect: @escaping (PaymentTransaction) -> Void) {
        self.viewModel = viewModel
        self.onSelect = onSelect
        _isFiltered = isFiltered
    }

    // MARK: Internal

    @Binding var isFiltered: Bool

    var body: some View {
        Group {
            if viewModel.transactions.isEmpty {
                EmptyList(viewModel: .init(title: viewModel.emptyState))
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.fixed(UIScreen.main.bounds.width))], content: {
                        ForEach(viewModel.transactions) { transaction in
                            Button(action: {
                                onSelect(transaction)
                            }, label: {
                                TransactionRowItem(model: .init(from: transaction))
                            })
                        }
                    })
                    .background(Color.Neutrals.neutral1)
                }.safeAreaInset(edge: .bottom) {
                    if isFiltered {
                        TotalAmount(
                            viewModel: .init(title: Localized.amountTitle, transactions: viewModel.transactions),
                            isPanelVisible: $isFiltered.animation())
                    }
                }
            }
        }
    }

    // MARK: Private

    private let viewModel: TransactionsList.ViewModel
    private let onSelect: (PaymentTransaction) -> Void
}

// MARK: TransactionsList.Localized

extension TransactionsList {
    fileprivate enum Localized {
        static let amountTitle = "Total amount"
    }
}
