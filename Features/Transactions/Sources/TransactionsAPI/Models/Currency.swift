import Foundation

// MARK: - Currency

public enum Currency: String {
    case PBP
}

// MARK: Codable, Hashable

extension Currency: Codable, Hashable { }
