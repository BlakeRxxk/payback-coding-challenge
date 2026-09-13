import Core
import UIKit

// MARK: - TransactionsBuildable

public protocol TransactionsBuildable: Buildable {
    func build() -> TransactionsRouting
}

// MARK: - TransactionsRouting

public protocol TransactionsRouting: Routing {
    var viewControllable: ViewControllable { get }
}

// MARK: - TransactionsBuilder

public final class TransactionsBuilder: Builder<TransactionsComponent>, TransactionsBuildable {

    // MARK: Lifecycle

    public override init(dependency: TransactionsComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Public

    public func build() -> TransactionsRouting {
        let navigationController = NavigationController()
        let interactor = TransactionsInteractor(component: dependency)
        let router = TransactionsRouter(
            interactor: interactor,
            navigationController: navigationController,
            transactionsListBuilder: TransactionsListBuilder(dependency: dependency),
            errorToastBuilder: ErrorToastBuilder(dependency: dependency))
        interactor.router = router
        return router
    }
}
