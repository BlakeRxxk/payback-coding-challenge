import SwiftUI

extension View {
    public func overlay<T: View>(isPresented: Binding<Bool>, @ViewBuilder _ block: @escaping () -> T) -> some View {
        modifier(OverlayModifier<T>(isPresented: isPresented) { _ in
            block()
        })
    }
}
