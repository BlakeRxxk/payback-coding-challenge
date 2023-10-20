import Foundation
import PBCore
import TransactionsAPI

// MARK: - TransactionDetail.ViewModel

extension TransactionDetail {
    struct ViewModel {

        // MARK: Lifecycle

        init(title: String, details: [TransactionDetailRow.ViewModel]) {
            self.title = title
            self.details = details
        }

        init(from transaction: PBTransaction) {
            title = transaction.partnerDisplayName
            details = [
                .init(
                    title: Localized.bookingDate,
                    detail: DateFactory.dateOutputFormatter.string(from: transaction.transactionDetail.bookingDate)),
                .init(title: Localized.description, detail: transaction.transactionDetail.description ?? ""),
                .init(title: Localized.amount, detail: NumberFactory.rawToMoneyString(
                    value: "\(transaction.transactionDetail.value.amount)",
                    precision: 0,
                    currencyCode: transaction.transactionDetail.value.currency.rawValue)),
                .init(title: Localized.reference, detail: transaction.alias.reference),
            ]
        }

        // MARK: Internal

        let title: String
        let details: [TransactionDetailRow.ViewModel]
    }
}

// MARK: - TransactionDetail.ViewModel.Localized

extension TransactionDetail.ViewModel {
    fileprivate enum Localized {
        static let bookingDate = "Booking Date"
        static let description = "Description"
        static let amount = "Amount"
        static let reference = "Reference"
    }
}
