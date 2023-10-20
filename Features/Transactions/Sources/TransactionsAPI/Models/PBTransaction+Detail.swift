import Foundation

// MARK: - PBTransaction.Detail

extension PBTransaction {
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

// MARK: - PBTransaction.Detail + Codable, Hashable

extension PBTransaction.Detail: Codable, Hashable { }
