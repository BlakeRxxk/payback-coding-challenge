import Foundation

// MARK: - CategoryMenu.ViewModel

extension CategoryMenu {
    struct ViewModel {
        var categories: [Category]
    }
}

// MARK: - Category

struct Category {
    let id: Int
    let title: String
    let value: Int
}

// MARK: Hashable, Identifiable, Sendable

extension Category: Hashable, Identifiable, Sendable { }
