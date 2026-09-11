import Core
import FeedAPI
import FeedImplementation
import TransactionsAPI
import TransactionsImplementation

// MARK: - RootRouting

protocol RootRouting: LaunchRouting {}

// MARK: - RootRouter

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // MARK: Lifecycle

    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        transactionsBuilder: TransactionsBuildable,
        feedBuilder: FeedBuildable)
    {
        self.transactionsBuilder = transactionsBuilder
        self.feedBuilder = feedBuilder
        super.init(interactor: interactor, viewController: viewController)
    }

    // MARK: Internal

    override func didLoad() {
        super.didLoad()
        attachChildren()
    }

    // MARK: Private

    private func attachChildren() {
        let transactionsRouter = transactionsBuilder.build()
        attachChild(transactionsRouter)
        let feedRouter = feedBuilder.build()
        attachChild(feedRouter)
        viewController.set(viewControllers: [
            transactionsRouter.viewControllable.uiviewController,
            feedRouter.viewControllable.uiviewController,
        ])
    }

    private let transactionsBuilder: TransactionsBuildable
    private let feedBuilder: FeedBuildable
}