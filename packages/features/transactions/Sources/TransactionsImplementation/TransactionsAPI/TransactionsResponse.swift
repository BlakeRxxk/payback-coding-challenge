import Foundation
import TransactionsAPI

// MARK: - TransactionsResponse

public struct TransactionsResponse {
    public let items: [PaymentTransaction]
}

// MARK: Codable, Hashable

extension TransactionsResponse: Codable, Hashable, Sendable { }
