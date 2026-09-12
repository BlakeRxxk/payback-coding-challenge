import Core
import DesignSystem

// MARK: - ErrorToastInteractable

protocol ErrorToastInteractable: Interactable { }

// MARK: - ErrorToastInteractor

final class ErrorToastInteractor: Interactor, ErrorToastInteractable {

    // MARK: Lifecycle

    init(component: TransactionsComponent, viewController: ErrorToastViewControllable) {
        self.component = component
        self.viewController = viewController
    }

    // MARK: Internal

    // MARK: Interactor

    override func didBecomeActive() {
        super.didBecomeActive()
        Task { @MainActor in
            let viewModel = component.transactionsViewModel
            viewController.configure(
                toast: Toast(
                    viewModel: .init(title: Localized.title, description: Localized.description, actionTitle: Localized.actionTitle))
                {
                    Task {
                        await viewModel.fetchTransactions()
                    }
                })
        }
    }

    // MARK: Private

    private let component: TransactionsComponent
    private let viewController: ErrorToastViewControllable
}

// MARK: ErrorToastInteractor.Localized

extension ErrorToastInteractor {
    fileprivate enum Localized {
        static let title = "Error"
        static let description = "Something went wrong"
        static let actionTitle = "Retry"
    }
}
