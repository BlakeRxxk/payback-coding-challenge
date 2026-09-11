import Core

// MARK: - TransactionsInteractable

protocol TransactionsInteractable: Interactable { }

// MARK: - TransactionsInteractor

final class TransactionsInteractor: Interactor, TransactionsInteractable {

    // MARK: Lifecycle

    init(component: TransactionsComponent, viewController: TransactionsViewControllable) {
        self.component = component
        self.viewController = viewController
    }

    // MARK: Internal

    override func didBecomeActive() {
        super.didBecomeActive()
        Task { @MainActor in
            let viewModel = component.transactionsViewModel
            viewController.embed(content: TransactionsListScene(viewModel: viewModel))
        }
    }

    // MARK: Private

    private let component: TransactionsComponent
    private let viewController: TransactionsViewControllable
}
