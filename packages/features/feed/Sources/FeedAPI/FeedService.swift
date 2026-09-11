/// This package is outlined as a future Feed Feature

import TransactionsAPI

public protocol FeedService: Sendable {
    func fetchFeed() async throws -> [PaymentTransaction]
}
