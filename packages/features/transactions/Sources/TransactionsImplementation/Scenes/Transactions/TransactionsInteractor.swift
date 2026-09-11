import Combine
import Core
import TransactionsAPI

// MARK: - TransactionsInteractable

protocol TransactionsInteractable: Interactable, TransactionsListListener, TransactionsDetailsListener { }

// MARK: - TransactionsInteractor

final class TransactionsInteractor: Interactor, TransactionsInteractable {

    // MARK: Lifecycle

    init(component: TransactionsComponent) {
        self.component = component
    }

    // MARK: Internal

    weak var router: TransactionsRouter?

    // MARK: Interactor

    override func didBecomeActive() {
        super.didBecomeActive()
        Task { @MainActor in
            let viewModel = component.transactionsViewModel
            errorCancellable = viewModel.$hasError
                .dropFirst()
                .removeDuplicates()
                .sink { [weak self] hasError in
                    guard let self else { return }
                    if hasError {
                        router?.attachErrorToast()
                    } else {
                        router?.detachErrorToast()
                    }
                }
        }
    }

    override func willResignActive() {
        super.willResignActive()
        errorCancellable = nil
    }

    // MARK: TransactionsListListener

    func didSelectTransaction(_ transaction: PaymentTransaction) {
        router?.presentDetails(for: transaction)
    }

    // MARK: TransactionsDetailsListener

    func transactionsDetailsDidDisappear() {
        router?.detachDetails()
    }

    // MARK: Private

    private let component: TransactionsComponent
    private var errorCancellable: AnyCancellable?
}
