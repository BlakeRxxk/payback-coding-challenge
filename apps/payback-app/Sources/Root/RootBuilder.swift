import Core
import FeedImplementation
import TransactionsImplementation

// MARK: - RootBuildable

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

// MARK: - RootBuilder

final class RootBuilder: Builder<AppComponent>, RootBuildable {

    // MARK: Lifecycle

    override init(dependency: AppComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Internal

    func build() -> RootRouting {
        let viewController = RootViewController()
        let interactor = RootInteractor()
        let transactionsBuilder = TransactionsBuilder(dependency: dependency.transactionsComponent)
        let feedBuilder = FeedBuilder(dependency: dependency.feedComponent)
        return RootRouter(
            interactor: interactor,
            viewController: viewController,
            transactionsBuilder: transactionsBuilder,
            feedBuilder: feedBuilder)
    }
}