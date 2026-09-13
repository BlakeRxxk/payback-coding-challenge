import Core
import TransactionsAPI

// MARK: - TransactionsListBuildable

protocol TransactionsListBuildable: Buildable {
    func build(navigationController: NavigationController) -> TransactionsListRouting
}

// MARK: - TransactionsListRouting

protocol TransactionsListRouting: ViewableRouting { }

// MARK: - TransactionsListBuilder

final class TransactionsListBuilder: Builder<TransactionsComponent>, TransactionsListBuildable {

    // MARK: Lifecycle

    override init(dependency: TransactionsComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Internal

    func build(navigationController: NavigationController) -> TransactionsListRouting {
        let viewController = TransactionsListViewController()
        let interactor = TransactionsListInteractor(component: dependency, viewController: viewController)
        let router = TransactionsListRouter(
            interactor: interactor,
            viewController: viewController,
            navigationController: navigationController,
            transactionsDetailsBuilder: TransactionsDetailsBuilder(dependency: dependency))
        interactor.router = router
        return router
    }
}