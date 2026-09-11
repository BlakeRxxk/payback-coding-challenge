import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Internal

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let router = RootBuilder(dependency: AppComponent()).build()
        self.router = router
        router.launch(from: window)
    }

    // MARK: Private

    private var router: RootRouting?
}