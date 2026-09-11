import Core

// MARK: - FeedInteractable

protocol FeedInteractable: Interactable { }

// MARK: - FeedInteractor

final class FeedInteractor: Interactor, FeedInteractable {

    // MARK: Lifecycle

    init(component: FeedComponent, viewController: FeedViewControllable) {
        self.component = component
        self.viewController = viewController
    }

    // MARK: Internal

    override func didBecomeActive() {
        super.didBecomeActive()
        let viewModel = component.feedViewModel
        viewController.embed(content: FeedView(viewModel: viewModel))
    }

    // MARK: Private

    private let component: FeedComponent
    private let viewController: FeedViewControllable
}
