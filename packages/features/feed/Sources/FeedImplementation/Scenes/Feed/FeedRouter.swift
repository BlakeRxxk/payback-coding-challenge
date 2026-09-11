import Core

// MARK: - FeedRouter

final class FeedRouter: ViewableRouter<FeedInteractable, FeedViewControllable>, FeedRouting {

    override init(interactor: FeedInteractable, viewController: FeedViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}
