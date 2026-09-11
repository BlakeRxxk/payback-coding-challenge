import Foundation

// MARK: - PaymentTransaction.Alias

extension PaymentTransaction {
    public struct Alias {
        public let reference: String

        public init(reference: String) {
            self.reference = reference
        }
    }
}

// MARK: - PaymentTransaction.Alias + Codable, Hashable, Sendable

extension PaymentTransaction.Alias: Codable, Hashable, Sendable { }
