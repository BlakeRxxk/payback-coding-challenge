import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    let registeredFactories: AppComponent

    init() {
        registeredFactories = AppComponent()
        
        setupAppearance()
    }

    var body: some Scene {
        WindowGroup {
            RootView(rootComponent: registeredFactories.rootComponent)
        }
    }
    
    @MainActor
    private func setupAppearance() {
        UITabBar.appearance().backgroundColor = UIColor(Color.Shades.shade1)
        UITabBar.appearance().backgroundImage = UIImage()

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
