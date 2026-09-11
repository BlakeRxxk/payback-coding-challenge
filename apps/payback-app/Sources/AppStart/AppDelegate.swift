import DesignSystem
import SwiftUI
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Internal

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        configureAppearance()
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting session: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: nil, sessionRole: session.role)
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }

    // MARK: Private

    @MainActor
    private func configureAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.Shades.shade1)
        UITabBar.appearance().standardAppearance = tabBarAppearance

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.backgroundColor = UIColor(Color.Shades.shade1)
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.Shades.shade2)]
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.Shades.shade2)]

        UISearchBar.appearance().tintColor = UIColor(Color.Accents.accent2)

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
