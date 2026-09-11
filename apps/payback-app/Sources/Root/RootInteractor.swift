import Core

// MARK: - RootInteractable

protocol RootInteractable: Interactable {}

// MARK: - RootInteractor

final class RootInteractor: Interactor, RootInteractable {}