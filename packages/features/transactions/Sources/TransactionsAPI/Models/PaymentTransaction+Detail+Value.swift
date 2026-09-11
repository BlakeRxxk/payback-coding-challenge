import Foundation

// MARK: - PaymentTransaction.Detail.Value

extension PaymentTransaction.Detail {
    public struct Value {
        public let amount: Int
        public let currency: Currency

        public init(amount: Int, currency: Currency) {
            self.amount = amount
            self.currency = currency
        }
    }
}

// MARK: - PaymentTransaction.Detail.Value + Codable, Hashable, Sendable

extension PaymentTransaction.Detail.Value: Codable, Hashable, Sendable { }
