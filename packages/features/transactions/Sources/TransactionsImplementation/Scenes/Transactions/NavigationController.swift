import Core
import UIKit

// MARK: - NavigationController

final class NavigationController: UINavigationController, ViewControllable {

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = true
    }
}
