import Foundation
import TransactionsAPI

// MARK: - MockTransactionService

final class MockTransactionService: TransactionsService {
    func fetchTansactions() async throws -> [PaymentTransaction] {
        MockTransactionService.mockData
    }
}

// MARK: - MockTransactionServiceWithFail

final class MockTransactionServiceWithFail: TransactionsService {
    func fetchTansactions() async throws -> [PaymentTransaction] {
        throw NSError(domain: "error", code: 500)
    }
}

extension MockTransactionService {
    static let mockData = [
        PaymentTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "795357452000810"),
            category: 1,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: Date(),
                value: .init(amount: 100, currency: .PBP))),
        PaymentTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "094844835601044"),
            category: 2,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: Date(),
                value: .init(amount: 100, currency: .PBP))),
    ]
}
