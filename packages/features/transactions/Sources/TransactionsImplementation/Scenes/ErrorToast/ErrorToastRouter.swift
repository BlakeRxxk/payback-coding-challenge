import Core

// MARK: - ErrorToastRouter

final class ErrorToastRouter: ViewableRouter<ErrorToastInteractable, ErrorToastViewControllable>, ErrorToastRouting {

    override init(interactor: ErrorToastInteractable, viewController: ErrorToastViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}
