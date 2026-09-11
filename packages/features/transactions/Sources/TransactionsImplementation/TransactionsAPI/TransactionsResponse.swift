import Foundation
import TransactionsAPI

// MARK: - TransactionsResponse

public struct TransactionsResponse {
    public let items: [PBTransaction]
}

// MARK: Codable, Hashable

extension TransactionsResponse: Codable, Hashable { }
