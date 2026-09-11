import Core
import TransactionsAPI

// MARK: - TransactionsDetailsBuildable

protocol TransactionsDetailsBuildable: Buildable {
    func build(with transaction: PaymentTransaction, listener: TransactionsDetailsListener) -> TransactionsDetailsRouting
}

// MARK: - TransactionsDetailsRouting

protocol TransactionsDetailsRouting: ViewableRouting { }

// MARK: - TransactionsDetailsBuilder

final class TransactionsDetailsBuilder: Builder<TransactionsComponent>, TransactionsDetailsBuildable {

    // MARK: Lifecycle

    override init(dependency: TransactionsComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Internal

    func build(with transaction: PaymentTransaction, listener: TransactionsDetailsListener) -> TransactionsDetailsRouting {
        let viewController = TransactionsDetailsViewController()
        let interactor = TransactionsDetailsInteractor(transaction: transaction, viewController: viewController, listener: listener)
        return TransactionsDetailsRouter(interactor: interactor, viewController: viewController)
    }
}
