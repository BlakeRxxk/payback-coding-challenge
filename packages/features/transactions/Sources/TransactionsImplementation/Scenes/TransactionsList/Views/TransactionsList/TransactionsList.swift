import Foundation
import SwiftUI
import TransactionsAPI

// MARK: - TransactionsList

struct TransactionsList: View {

    // MARK: Lifecycle

    init(viewModel: TransactionsList.ViewModel, isFiltered: Binding<Bool>) {
        self.viewModel = viewModel
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
                                selectedTransaction = transaction
                            }, label: {
                                TransactionRowItem(model: .init(from: transaction))
                            })
                            .sheet(item: $selectedTransaction, onDismiss: {
                                selectedTransaction = nil
                            }, content: {
                                TransactionDetail(viewModel: .init(from: $0))
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

    @Environment(\.presentationMode)
    private var presentationMode: Binding<PresentationMode>

    @State
    private var selectedTransaction: PBTransaction? = nil
}

// MARK: TransactionsList.Localized

extension TransactionsList {
    fileprivate enum Localized {
        static let amountTitle = "Total amount"
    }
}
