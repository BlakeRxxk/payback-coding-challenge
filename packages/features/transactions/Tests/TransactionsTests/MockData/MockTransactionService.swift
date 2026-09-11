import Foundation
import TransactionsAPI

// MARK: - MockTransactionService

class MockTransactionService: TransactionsService {
    func fetchTansactions() async throws -> [PBTransaction] {
        MockTransactionService.mockData
    }
}

// MARK: - MockTransactionServiceWithFail

class MockTransactionServiceWithFail: TransactionsService {
    func fetchTansactions() async throws -> [PBTransaction] {
        throw NSError(domain: "error", code: 500)
    }
}

extension MockTransactionService {
    static let mockData = [
        PBTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "795357452000810"),
            category: 1,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: Date(),
                value: .init(amount: 100, currency: .PBP))),
        PBTransaction(
            partnerDisplayName: "REWE Group",
            alias: .init(reference: "094844835601044"),
            category: 2,
            transactionDetail: .init(
                description: "Punkte sammeln",
                bookingDate: Date(),
                value: .init(amount: 100, currency: .PBP))),
    ]
}
