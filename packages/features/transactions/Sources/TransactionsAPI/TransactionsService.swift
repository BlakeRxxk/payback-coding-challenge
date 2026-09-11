import Foundation

// MARK: - TransactionsService

public protocol TransactionsService: Sendable {
    func fetchTansactions() async throws -> [PaymentTransaction]
}
