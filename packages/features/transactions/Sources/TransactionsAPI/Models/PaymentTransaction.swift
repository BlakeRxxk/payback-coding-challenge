import Foundation

// MARK: - PaymentTransaction

public struct PaymentTransaction {
    public let partnerDisplayName: String
    public let alias: PaymentTransaction.Alias
    public let category: Int
    public let transactionDetail: PaymentTransaction.Detail

    public init(partnerDisplayName: String, alias: PaymentTransaction.Alias, category: Int, transactionDetail: PaymentTransaction.Detail) {
        self.partnerDisplayName = partnerDisplayName
        self.alias = alias
        self.category = category
        self.transactionDetail = transactionDetail
    }
}

// MARK: Codable, Hashable, Sendable

extension PaymentTransaction: Codable, Hashable, Sendable { }

// MARK: Identifiable

extension PaymentTransaction: Identifiable {
    public var id: String {
        alias.reference
    }
}
