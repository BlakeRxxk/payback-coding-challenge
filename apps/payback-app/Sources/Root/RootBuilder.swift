import Core

// MARK: - RootBuildable

protocol RootBuildable: Buildable {
    func build() -> RootRouting
}

// MARK: - RootBuilder

final class RootBuilder: Builder<AppComponent>, RootBuildable {

    // MARK: Lifecycle

    override init(dependency: AppComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Internal

    func build() -> RootRouting {
        let viewController = RootViewController()
        let interactor = RootInteractor(appComponent: dependency, viewController: viewController)
        return RootRouter(interactor: interactor, viewController: viewController)
    }
}