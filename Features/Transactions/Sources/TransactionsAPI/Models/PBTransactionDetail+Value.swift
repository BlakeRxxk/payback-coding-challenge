import Foundation

// MARK: - PBTransaction.Detail.Value

extension PBTransaction.Detail {
    public struct Value {
        public let amount: Int
        public let currency: Currency

        public init(amount: Int, currency: Currency) {
            self.amount = amount
            self.currency = currency
        }
    }
}

// MARK: - PBTransaction.Detail.Value + Codable, Hashable, Sendable

extension PBTransaction.Detail.Value: Codable, Hashable, Sendable { }
