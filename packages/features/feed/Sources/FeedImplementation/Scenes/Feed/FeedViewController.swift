import Core
import SwiftUI

// MARK: - FeedViewControllable

protocol FeedViewControllable: ViewControllable {
    func embed(content: some View)
}

// MARK: - FeedViewController

final class FeedViewController: UIViewController, FeedViewControllable {

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

// MARK: - FeedView

struct FeedView: View {
    let viewModel: FeedViewModel

    var body: some View {
        Text("Placeholder for Feed Feature")
    }
}
