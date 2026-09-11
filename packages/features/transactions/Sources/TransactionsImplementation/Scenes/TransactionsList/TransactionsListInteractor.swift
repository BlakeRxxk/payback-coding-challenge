import Core
import TransactionsAPI

// MARK: - TransactionsListInteractable

protocol TransactionsListInteractable: Interactable { }

// MARK: - TransactionsListListener

protocol TransactionsListListener: AnyObject {
    func didSelectTransaction(_ transaction: PaymentTransaction)
}

// MARK: - TransactionsListInteractor

final class TransactionsListInteractor: Interactor, TransactionsListInteractable {

    // MARK: Lifecycle

    init(component: TransactionsComponent, viewController: TransactionsListViewControllable, listener: TransactionsListListener) {
        self.component = component
        self.viewController = viewController
        self.listener = listener
    }

    // MARK: Internal

    // MARK: Interactor

    override func didBecomeActive() {
        super.didBecomeActive()
        Task { @MainActor in
            let viewModel = component.transactionsViewModel
            viewController.embed(content: TransactionsListScene(viewModel: viewModel) { [weak self] transaction in
                self?.listener?.didSelectTransaction(transaction)
            })
            await viewModel.fetchTransactions()
        }
    }

    // MARK: Private

    private let component: TransactionsComponent
    private let viewController: TransactionsListViewControllable
    private weak var listener: TransactionsListListener?
}
