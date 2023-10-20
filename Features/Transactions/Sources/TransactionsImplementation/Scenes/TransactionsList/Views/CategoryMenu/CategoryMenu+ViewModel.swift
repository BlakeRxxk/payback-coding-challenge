import Foundation

// MARK: - CategoryMenu.ViewModel

extension CategoryMenu {
    struct ViewModel {
        var categories: [Category]
    }
}

// MARK: - Category

struct Category: Hashable, Identifiable {
    let id: Int
    let title: String
    let value: Int
}
