import Core

// MARK: - TransactionsRouter

final class TransactionsRouter: ViewableRouter<TransactionsInteractable, TransactionsViewControllable>, TransactionsRouting {

    override init(interactor: TransactionsInteractable, viewController: TransactionsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}
