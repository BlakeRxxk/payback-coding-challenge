import SwiftUI

// MARK: - PrimaryButtonStyle

struct PrimaryButtonStyle: ButtonStyle {

    // MARK: Internal

    func makeBody(configuration: Configuration) -> some View {
        InternalButton(configuration: configuration)
    }

    // MARK: Private

    @Environment(\.isLoading) private var isLoading: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool
}

// MARK: PrimaryButtonStyle.InternalButton

extension PrimaryButtonStyle {
    struct InternalButton: View {

        // MARK: Lifecycle

        init(configuration: ButtonStyle.Configuration) {
            self.configuration = configuration
        }

        // MARK: Internal

        let configuration: ButtonStyle.Configuration

        var body: some View {
            HStack {
                ZStack {
                    EllipsesLoader()
                        .opacity(isLoading ? 1 : 0)
                    configuration
                        .label
                        .style(.body13Semibold, color: Color.Shades.shade1)
                        .opacity(isLoading ? 0 : 1)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            }
            .background(backgroundColor)
            .cornerRadius(8)
            .animation(.easeInOut, value: 0.25)
        }

        var backgroundColor: some View {
            if !isEnabled || isLoading {
                return AnyView(Color.Neutrals.neutral3)
            }

            return AnyView(configuration.isPressed ? EllipticalGradient.gradient1 : EllipticalGradient.gradient3)
        }

        // MARK: Private

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.isLoading) private var isLoading: Bool
    }
}
