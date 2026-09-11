import Core

// MARK: - ErrorToastBuildable

protocol ErrorToastBuildable: Buildable {
    func build() -> ErrorToastRouting
}

// MARK: - ErrorToastRouting

protocol ErrorToastRouting: ViewableRouting { }

// MARK: - ErrorToastBuilder

final class ErrorToastBuilder: Builder<TransactionsComponent>, ErrorToastBuildable {

    // MARK: Lifecycle

    override init(dependency: TransactionsComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Internal

    func build() -> ErrorToastRouting {
        let viewController = ErrorToastViewController()
        let interactor = ErrorToastInteractor(component: dependency, viewController: viewController)
        return ErrorToastRouter(interactor: interactor, viewController: viewController)
    }
}
