import Core
import SwiftUI
import UIKit

// MARK: - ErrorToastViewControllable

protocol ErrorToastViewControllable: ViewControllable {
    func embed(content: some View)
}

// MARK: - ErrorToastViewController

final class ErrorToastViewController: UIViewController, ErrorToastViewControllable {

    func embed(content: some View) {
        let hostingController = UIHostingController(rootView: content)
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        hostingController.didMove(toParent: self)
    }
}
