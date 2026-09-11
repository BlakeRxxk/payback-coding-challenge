import Foundation
import TransactionsAPI

extension TransactionsList {
    struct ViewModel {
        let emptyState: String
        let transactions: [PaymentTransaction]
        let isFiltered: Bool

        init(emptyState: String, transactions: [PaymentTransaction], isFiltered: Bool = false) {
            self.emptyState = emptyState
            self.transactions = transactions
            self.isFiltered = isFiltered
        }
    }
}
