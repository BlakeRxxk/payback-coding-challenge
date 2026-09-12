import Core
import TransactionsAPI

// MARK: - TransactionsDetailsInteractable

protocol TransactionsDetailsInteractable: Interactable { }

// MARK: - TransactionsDetailsListener

protocol TransactionsDetailsListener: AnyObject {
    func transactionsDetailsDidDisappear()
}

// MARK: - TransactionsDetailsInteractor

final class TransactionsDetailsInteractor: Interactor, TransactionsDetailsInteractable {

    // MARK: Lifecycle

    init(transaction: PaymentTransaction, viewController: TransactionsDetailsViewControllable, listener: TransactionsDetailsListener) {
        self.transaction = transaction
        self.viewController = viewController
        self.listener = listener
    }

    // MARK: Internal

    // MARK: Interactor

    override func didBecomeActive() {
        super.didBecomeActive()
        viewController.onDismiss = { [weak self] in
            self?.listener?.transactionsDetailsDidDisappear()
        }
        viewController.configure(with: TransactionsDetailsViewModel(from: transaction))
    }

    // MARK: Private

    private let transaction: PaymentTransaction
    private let viewController: TransactionsDetailsViewControllable
    private weak var listener: TransactionsDetailsListener?
}
