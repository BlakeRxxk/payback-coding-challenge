import SwiftUI

struct RootView: View {
   
    // MARK: Lifecycle
    
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }

    // MARK: Internal
    
    var body: some View {
        rootComponent.transactions.view
    }
    
    // MARK: Private
    
    private let rootComponent: RootComponent
}
