import Core

// MARK: - FeedBuildable

public protocol FeedBuildable: Buildable {
    func build() -> FeedRouting
}

// MARK: - FeedRouting

public protocol FeedRouting: ViewableRouting { }

// MARK: - FeedBuilder

public final class FeedBuilder: Builder<FeedComponent>, FeedBuildable {

    // MARK: Lifecycle

    public override init(dependency: FeedComponent) {
        super.init(dependency: dependency)
    }

    // MARK: Public

    public func build() -> FeedRouting {
        let viewController = FeedViewController()
        let interactor = FeedInteractor(component: dependency, viewController: viewController)
        return FeedRouter(interactor: interactor, viewController: viewController)
    }
}
