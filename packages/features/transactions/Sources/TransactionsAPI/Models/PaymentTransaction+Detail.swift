import Foundation

// MARK: - PaymentTransaction.Detail

extension PaymentTransaction {
    public struct Detail {
        public let description: String?
        public let bookingDate: Date
        public let value: Value

        public init(description: String?, bookingDate: Date, value: Value) {
            self.description = description
            self.bookingDate = bookingDate
            self.value = value
        }
    }
}

// MARK: - PaymentTransaction.Detail + Codable, Hashable, Sendable

extension PaymentTransaction.Detail: Codable, Hashable, Sendable { }
