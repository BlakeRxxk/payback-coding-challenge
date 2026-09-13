import Core
import TransactionsAPI
import UIKit

// MARK: - TransactionsListRouter

final class TransactionsListRouter: ViewableRouter<TransactionsListInteractable, TransactionsListViewControllable>, TransactionsListRouting {

    // MARK: Lifecycle

    init(
        interactor: TransactionsListInteractable,
        viewController: TransactionsListViewControllable,
        navigationController: NavigationController,
        transactionsDetailsBuilder: TransactionsDetailsBuildable)
    {
        self.navigationController = navigationController
        self.transactionsDetailsBuilder = transactionsDetailsBuilder
        super.init(interactor: interactor, viewController: viewController)
    }

    // MARK: Transactions Details

    func presentDetails(for transaction: PaymentTransaction) {
        guard detailsRouter == nil else { return }
        let router = transactionsDetailsBuilder.build(with: transaction, listener: interactor)
        attachChild(router)
        detailsRouter = router
        let detailsNavigationController = UINavigationController(rootViewController: router.viewControllable.uiviewController)
        navigationController.present(detailsNavigationController, animated: true)
    }

    func detachDetails() {
        guard let detailsRouter else { return }
        self.detailsRouter = nil
        detachChild(detailsRouter)
    }

    // MARK: Private

    private let navigationController: NavigationController
    private let transactionsDetailsBuilder: TransactionsDetailsBuildable

    private var detailsRouter: TransactionsDetailsRouting?
}