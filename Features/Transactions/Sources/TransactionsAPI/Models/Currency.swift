import Foundation

// MARK: - Currency

public enum Currency: String {
    case PBP
}

// MARK: Codable, Hashable, Sendable

extension Currency: Codable, Hashable, Sendable { }
