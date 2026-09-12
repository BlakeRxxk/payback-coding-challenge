import Core
import TransactionsAPI
import XCTest
@testable import TransactionsImplementation

// MARK: - TransactionsDetailsViewModelTests

final class TransactionsDetailsViewModelTests: XCTestCase {
    func testViewModelMapsTransaction() throws {
        let bookingDate = Date(timeIntervalSince1970: 1_500_000_000)
        let transaction = PaymentTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "795357452000810"),
            category: 1,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: bookingDate,
                value: .init(amount: 100, currency: .PBP)))

        let viewModel = TransactionsDetailsViewModel(from: transaction)

        XCTAssertEqual(viewModel.title, "REWE Group")
        XCTAssertEqual(viewModel.details.count, 4)

        XCTAssertEqual(viewModel.details[0].title, "Booking Date")
        XCTAssertEqual(viewModel.details[0].detail, DateFactory.dateOutputFormatter.string(from: bookingDate))

        XCTAssertEqual(viewModel.details[1].title, "Description")
        XCTAssertEqual(viewModel.details[1].detail, "Punkte sammeln")

        XCTAssertEqual(viewModel.details[2].title, "Amount")
        XCTAssertEqual(viewModel.details[2].detail, NumberFactory.rawToMoneyString(value: "100", precision: 0, currencyCode: "PBP"))

        XCTAssertEqual(viewModel.details[3].title, "Reference")
        XCTAssertEqual(viewModel.details[3].detail, "795357452000810")
    }

    func testViewModelMapsMissingDescriptionToEmptyString() throws {
        let transaction = PaymentTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "795357452000810"),
            category: 1,
            transactionDetail: .init(
                description: nil,
                bookingDate: Date(),
                value: .init(amount: 100, currency: .PBP)))

        let viewModel = TransactionsDetailsViewModel(from: transaction)

        XCTAssertEqual(viewModel.details[1].title, "Description")
        XCTAssertEqual(viewModel.details[1].detail, "")
    }
}
