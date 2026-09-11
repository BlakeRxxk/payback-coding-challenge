import Core
import SwiftUI

// MARK: - RootInteractable

protocol RootInteractable: Interactable {}

// MARK: - RootInteractor

final class RootInteractor: Interactor, RootInteractable {

    // MARK: Lifecycle

    init(appComponent: AppComponent, viewController: RootViewControllable) {
        self.appComponent = appComponent
        self.viewController = viewController
        super.init()
    }

    // MARK: Internal

    override func didBecomeActive() {
        super.didBecomeActive()

        let rootComponent = RootComponent(dependency: appComponent)
        let hostingController = UIHostingController(rootView: RootView(rootComponent: rootComponent))
        viewController?.embed(content: hostingController)
    }

    // MARK: Private

    private let appComponent: AppComponent
    private weak var viewController: RootViewControllable?
}