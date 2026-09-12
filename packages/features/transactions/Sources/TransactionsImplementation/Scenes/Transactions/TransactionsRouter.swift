import Core
import TransactionsAPI
import UIKit

// MARK: - TransactionsRouter

final class TransactionsRouter: Router<TransactionsInteractable>, TransactionsRouting {

    // MARK: Lifecycle

    init(
        interactor: TransactionsInteractable,
        navigationController: NavigationController,
        transactionsListBuilder: TransactionsListBuildable,
        transactionsDetailsBuilder: TransactionsDetailsBuildable,
        errorToastBuilder: ErrorToastBuildable)
    {
        self.navigationController = navigationController
        self.transactionsListBuilder = transactionsListBuilder
        self.transactionsDetailsBuilder = transactionsDetailsBuilder
        self.errorToastBuilder = errorToastBuilder
        super.init(interactor: interactor)
    }

    // MARK: Internal

    var viewControllable: ViewControllable {
        navigationController
    }

    override func didLoad() {
        super.didLoad()
        attachTransactionsList()
    }

    // MARK: Transactions

    func presentDetails(for transaction: PaymentTransaction) {
        guard detailsRouter == nil else { return }
        let router = transactionsDetailsBuilder.build(with: transaction, listener: interactor)
        attachChild(router)
        detailsRouter = router
        let detailsNavigationController = UINavigationController(rootViewController: router.viewControllable.uiviewController)
        detailsPresentationController = detailsNavigationController
        navigationController.present(detailsNavigationController, animated: true)
    }

    func detachDetails() {
        guard let detailsRouter else { return }
        self.detailsRouter = nil
        detailsPresentationController = nil
        detachChild(detailsRouter)
    }

    // MARK: Error Toast

    func attachErrorToast() {
        guard errorToastRouter == nil else { return }
        let router = errorToastBuilder.build()
        attachChild(router)
        errorToastRouter = router
        let viewController = router.viewControllable.uiviewController
        navigationController.addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        navigationController.view.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: navigationController.view.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: navigationController.view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: navigationController.view.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: navigationController.view.bottomAnchor),
        ])
        viewController.didMove(toParent: navigationController)
    }

    func detachErrorToast() {
        guard let errorToastRouter else { return }
        self.errorToastRouter = nil
        let viewController = errorToastRouter.viewControllable.uiviewController
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        detachChild(errorToastRouter)
    }

    // MARK: Private

    private let navigationController: NavigationController
    private let transactionsListBuilder: TransactionsListBuildable
    private let transactionsDetailsBuilder: TransactionsDetailsBuildable
    private let errorToastBuilder: ErrorToastBuildable

    private var detailsRouter: TransactionsDetailsRouting?
    private var detailsPresentationController: UINavigationController?
    private var errorToastRouter: ErrorToastRouting?

    private func attachTransactionsList() {
        let router = transactionsListBuilder.build(withListener: interactor)
        attachChild(router)
        navigationController.viewControllers = [router.viewControllable.uiviewController]
    }

}
