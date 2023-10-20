import Foundation
import PBCore
import TransactionsAPI

extension TransactionRowItem {
    struct ViewModel {
        let displayName: String
        let bookingDate: String?
        let description: String?
        let amount: String

        init(from transaction: PBTransaction) {
            displayName = transaction.partnerDisplayName
            bookingDate = DateFactory.dateOutputFormatter.string(from: transaction.transactionDetail.bookingDate)
            description = transaction.transactionDetail.description
            amount = NumberFactory.rawToMoneyString(
                value: "\(transaction.transactionDetail.value.amount)",
                precision: 0,
                currencyCode: transaction.transactionDetail.value.currency.rawValue)
        }
    }
}
