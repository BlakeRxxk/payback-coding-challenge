import TransactionsAPI

final class FeedViewModel {

    // MARK: Lifecycle

    init(transactionsService: TransactionsService) {
        self.transactionsService = transactionsService
    }

    // MARK: Private

    private let transactionsService: TransactionsService
}
