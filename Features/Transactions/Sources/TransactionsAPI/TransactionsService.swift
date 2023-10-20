import Foundation

// MARK: - TransactionsService

public protocol TransactionsService {
    func fetchTansactions() async throws -> [PBTransaction]
}
