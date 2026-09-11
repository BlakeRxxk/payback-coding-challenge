import Core

// MARK: - TransactionsListBuildable

protocol TransactionsListBuildable: Buildable {
    func build(withListener listener: TransactionsListListener) -> TransactionsListRouting
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

    func build(withListener listener: TransactionsListListener) -> TransactionsListRouting {
        let viewController = TransactionsListViewController()
        let interactor = TransactionsListInteractor(component: dependency, viewController: viewController, listener: listener)
        return TransactionsListRouter(interactor: interactor, viewController: viewController)
    }
}
