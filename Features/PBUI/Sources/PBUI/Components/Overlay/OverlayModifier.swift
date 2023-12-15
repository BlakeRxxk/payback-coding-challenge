import SwiftUI

public struct OverlayModifier<T: View>: ViewModifier {

    // MARK: Lifecycle

    public init(isPresented: Binding<Bool>, @ViewBuilder _ block: @escaping (Content) -> T) {
        self.block = block
        _isPresented = isPresented
    }

    // MARK: Public

    public func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                    block(content)
                        .offset(y: isPresented ? 0 : 120)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
            }
        }
    }

    // MARK: Private

    private let block: (Content) -> T
    @Binding private var isPresented: Bool
}
