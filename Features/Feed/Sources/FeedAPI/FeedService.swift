/// This package is outlined as a future Feed Feature

import TransactionsAPI

public protocol FeedService {
    func fetchFeed() async throws -> [PBTransaction]
}
