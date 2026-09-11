import Foundation
import TransactionsAPI

// MARK: - TransactionsResponse

public struct TransactionsResponse {
    public let items: [PaymentTransaction]
}

// MARK: Codable, Hashable, Sendable

extension TransactionsResponse: Codable, Hashable, Sendable { }
