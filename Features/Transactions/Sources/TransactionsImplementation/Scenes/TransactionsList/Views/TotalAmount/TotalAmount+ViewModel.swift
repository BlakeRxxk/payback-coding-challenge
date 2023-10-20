import Foundation
import PBCore
import TransactionsAPI

extension TotalAmount {

    struct ViewModel {
        let title: String
        let totalAmount: String
        let currency: String

        init(title: String, transactions: [PBTransaction]) {
            self.title = title
            let total = transactions.map { $0.transactionDetail.value.amount }.reduce(0, +)
            /// While all the current transactions in PBP, we can leave it as it is. A refactoring will be required to support multiple currencies.
            let currency = transactions.first?.transactionDetail.value.currency.rawValue ?? Currency.PBP.rawValue
            totalAmount = NumberFactory.rawToMoneyString(
                value: "\(total)",
                precision: 0,
                currencyCode: currency)
            self.currency = currency
        }
    }
}
