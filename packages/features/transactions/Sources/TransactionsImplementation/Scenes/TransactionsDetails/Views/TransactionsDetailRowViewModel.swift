import Foundation

// MARK: - TransactionsDetailRowViewModel

struct TransactionsDetailRowViewModel: Identifiable {

    // MARK: Lifecycle

    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }

    // MARK: Internal

    let id: String = UUID().uuidString
    let title: String
    let detail: String
}
