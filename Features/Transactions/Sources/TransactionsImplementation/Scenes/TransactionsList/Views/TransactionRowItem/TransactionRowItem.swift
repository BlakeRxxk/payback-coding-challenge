import PBCore
import PBUI
import SwiftUI
import TransactionsAPI

struct TransactionRowItem: View {

    // MARK: Lifecycle

    init(model: TransactionRowItem.ViewModel) {
        self.model = model
    }

    // MARK: Internal

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(model.displayName).style(.body16Medium)

                        model.description.map {
                            Text($0).style(.body14Regular)
                        }
                    }
                    model.bookingDate.map { Text($0).style(.body14Regular) }
                }
                Spacer()
                VStack {
                    Text(model.amount).style(.body16Medium)
                }
            }
        }
        .padding(.all, 16)
        .background(.white)
        .cornerRadius(12)
    }

    // MARK: Private

    private let model: TransactionRowItem.ViewModel

}

#Preview {
    TransactionRowItem(model: .init(
        from:
        .init(
            partnerDisplayName: "Mock name",
            alias: .init(reference: "1234567"),
            category: 1,
            transactionDetail:
            .init(
                description: "description",
                bookingDate: Date(),
                value: .init(amount: 125, currency: .PBP)))))
}
