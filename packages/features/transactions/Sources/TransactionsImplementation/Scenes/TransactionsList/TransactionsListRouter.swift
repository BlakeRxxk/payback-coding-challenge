import Core

// MARK: - TransactionsListRouter

final class TransactionsListRouter: ViewableRouter<TransactionsListInteractable, TransactionsListViewControllable>, TransactionsListRouting {

    override init(interactor: TransactionsListInteractable, viewController: TransactionsListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}
