import Core
import DesignSystem
import UIKit

// MARK: - ErrorToastViewControllable

protocol ErrorToastViewControllable: ViewControllable {
    func configure(toast: Toast)
}

// MARK: - ErrorToastViewController

final class ErrorToastViewController: UIViewController, ErrorToastViewControllable {

    override func loadView() {
        view = PassthroughView()
    }

    func configure(toast: Toast) {
        toast.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toast)
        NSLayoutConstraint.activate([
            toast.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toast.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toast.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: ErrorToastViewController.PassthroughView

extension ErrorToastViewController {
    private final class PassthroughView: UIView {
        override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let hit = super.hitTest(point, with: event)
            return hit == self ? nil : hit
        }
    }
}
