import Core
import UIKit

// MARK: - RootViewControllable

protocol RootViewControllable: ViewControllable {
    func embed(content: UIViewController)
}

// MARK: - RootViewController

final class RootViewController: UIViewController, RootViewControllable {

    // MARK: Internal

    func embed(content: UIViewController) {
        addChild(content)
        view.addSubview(content.view)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            content.view.topAnchor.constraint(equalTo: view.topAnchor),
            content.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            content.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        content.didMove(toParent: self)
    }
}