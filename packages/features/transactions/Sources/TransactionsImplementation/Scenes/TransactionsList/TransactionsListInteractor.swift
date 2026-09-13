import Core
import TransactionsAPI

// MARK: - TransactionsListInteractable

protocol TransactionsListInteractable: Interactable, TransactionsDetailsListener { }

// MARK: - TransactionsListInteractor

final class TransactionsListInteractor: Interactor, TransactionsListInteractable {

    // MARK: Lifecycle

    init(component: TransactionsComponent, viewController: TransactionsListViewControllable) {
        self.component = component
        self.viewController = viewController
    }

    // MARK: Internal

    weak var router: TransactionsListRouter?

    // MARK: Interactor

    override func didBecomeActive() {
        super.didBecomeActive()
        Task { @MainActor in
            let viewModel = component.transactionsViewModel
            viewController.embed(content: TransactionsListScene(viewModel: viewModel) { [weak self] transaction in
                self?.router?.presentDetails(for: transaction)
            })
            await viewModel.fetchTransactions()
        }
    }

    // MARK: TransactionsDetailsListener

    func transactionsDetailsDidDisappear() {
        router?.detachDetails()
    }

    // MARK: Private

    private let component: TransactionsComponent
    private let viewController: TransactionsListViewControllable
}