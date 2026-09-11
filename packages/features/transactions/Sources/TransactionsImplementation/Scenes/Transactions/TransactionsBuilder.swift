import Core

// MARK: - TransactionsBuildable

public protocol TransactionsBuildable: Buildable {
    func build() -> TransactionsRouting
}

// MARK: - TransactionsRouting

public protocol TransactionsRouting: ViewableRouting { }

// MARK: - TransactionsBuilder

public final class TransactionsBuilder: Builder<TransactionsComponent>, TransactionsBuildable {

    // MARK: Lifecycle

    public override init(dependency: TransactionsComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Public

    public func build() -> TransactionsRouting {
        let viewController = TransactionsViewController()
        let interactor = TransactionsInteractor(component: dependency, viewController: viewController)
        return TransactionsRouter(interactor: interactor, viewController: viewController)
    }
}
