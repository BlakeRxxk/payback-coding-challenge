import Foundation

// MARK: - PBTransaction

public struct PBTransaction {
    public let partnerDisplayName: String
    public let alias: PBTransaction.Alias
    public let category: Int
    public let transactionDetail: PBTransaction.Detail

    public init(partnerDisplayName: String, alias: PBTransaction.Alias, category: Int, transactionDetail: PBTransaction.Detail) {
        self.partnerDisplayName = partnerDisplayName
        self.alias = alias
        self.category = category
        self.transactionDetail = transactionDetail
    }
}

// MARK: Codable, Hashable

extension PBTransaction: Codable, Hashable { }

// MARK: Identifiable

extension PBTransaction: Identifiable {
    public var id: String {
        alias.reference
    }
}
