import Core
import UIKit

// MARK: - RootViewControllable

protocol RootViewControllable: ViewControllable {
    func set(viewControllers: [UIViewController])
}

// MARK: - RootViewController

final class RootViewController: UITabBarController, RootViewControllable {

    // MARK: Internal

    func set(viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: false)
    }
}