import Core
import NeedleFoundation
import TransactionsAPI

// MARK: - FeedDependency

public protocol FeedDependency: NeedleFoundation.Dependency {
    var transactionsService: TransactionsService { get }
}

// MARK: - FeedComponent

public final class FeedComponent: NeedleFoundation.Component<FeedDependency>, FeedDependency {

    // MARK: Lifecycle

    public override init(parent: NeedleFoundation.Scope) {
        super.init(parent: parent)
    }

    // MARK: Public

    public var transactionsService: TransactionsService {
        dependency.transactionsService
    }

    // MARK: Internal

    var feedViewModel: FeedViewModel {
        shared {
            FeedViewModel(transactionsService: transactionsService)
        }
    }
}
