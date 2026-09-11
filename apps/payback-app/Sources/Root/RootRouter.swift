import Core

// MARK: - RootRouting

protocol RootRouting: LaunchRouting {}

// MARK: - RootRouter

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // MARK: Lifecycle

    override init(interactor: RootInteractable, viewController: RootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}