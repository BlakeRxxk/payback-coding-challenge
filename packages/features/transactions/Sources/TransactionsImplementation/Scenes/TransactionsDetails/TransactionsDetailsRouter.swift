import Core

// MARK: - TransactionsDetailsRouter

final class TransactionsDetailsRouter: ViewableRouter<TransactionsDetailsInteractable, TransactionsDetailsViewControllable>, TransactionsDetailsRouting {

    override init(interactor: TransactionsDetailsInteractable, viewController: TransactionsDetailsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}
