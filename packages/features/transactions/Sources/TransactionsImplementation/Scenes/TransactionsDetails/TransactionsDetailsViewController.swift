import Core
import SwiftUI
import UIKit

// MARK: - TransactionsDetailsViewControllable

protocol TransactionsDetailsViewControllable: ViewControllable {
    var onDismiss: (() -> Void)? { get set }

    func embed(content: some View)
}

// MARK: - TransactionsDetailsViewController

final class TransactionsDetailsViewController: UIViewController, TransactionsDetailsViewControllable {

    var onDismiss: (() -> Void)?

    // MARK: UIViewController

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed {
            onDismiss?()
            onDismiss = nil
        }
    }

    // MARK: TransactionsDetailsViewControllable

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
