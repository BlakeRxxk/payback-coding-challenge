import SwiftUI

public struct EllipsesLoader: View {

    // MARK: Lifecycle

    public init() { }

    // MARK: Public

    public var body: some View {
        HStack(spacing: 6) {
            circle
                .foregroundColor(colors[colorIndex])
                .scaleEffect(scale)
                .animation(
                    .easeInOut
                        .repeatForever(autoreverses: true),
                    value: 0.5)

            circle
                .foregroundColor(colors[(colorIndex + 1) % colors.count])
                .scaleEffect(scale)
                .animation(
                    .easeInOut
                        .repeatForever(autoreverses: true)
                        .delay(0.4),
                    value: 0.5)

            circle
                .foregroundColor(colors[(colorIndex + 2) % colors.count])
                .scaleEffect(scale)
                .animation(
                    .easeInOut
                        .repeatForever(autoreverses: true)
                        .delay(0.8),
                    value: 0.5)
        }
        .onAppear {
            withAnimation(
                .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false)) {
                scale = 1.2
            }

            withAnimation(
                .easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)) {
                colorIndex = (colorIndex + 1) % colors.count
            }
        }
    }

    // MARK: Internal

    let colors: [Color] = [
        Color.Neutrals.neutral1,
        Color.Neutrals.neutral2,
        Color.Neutrals.neutral2,
    ]

    var circle: some View {
        Circle()
            .frame(width: 8, height: 8).padding(.vertical, 4)
    }

    // MARK: Private

    @State private var scale: CGFloat = 1.0
    @State private var colorIndex = 0
}

#Preview {
    Group {
        EllipsesLoader()
    }
}
