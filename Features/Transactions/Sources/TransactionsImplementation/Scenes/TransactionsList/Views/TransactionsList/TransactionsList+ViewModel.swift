import Foundation
import TransactionsAPI

extension TransactionsList {
    struct ViewModel {
        let emptyState: String
        let transactions: [PBTransaction]
        let isFiltered: Bool

        init(emptyState: String, transactions: [PBTransaction], isFiltered: Bool = false) {
            self.emptyState = emptyState
            self.transactions = transactions
            self.isFiltered = isFiltered
        }
    }
}
