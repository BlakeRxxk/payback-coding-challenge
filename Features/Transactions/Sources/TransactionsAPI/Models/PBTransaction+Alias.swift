import Foundation

// MARK: - PBTransaction.Alias

extension PBTransaction {
    public struct Alias {
        public let reference: String

        public init(reference: String) {
            self.reference = reference
        }
    }
}

// MARK: - PBTransaction.Alias + Codable, Hashable

extension PBTransaction.Alias: Codable, Hashable { }
