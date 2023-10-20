import SwiftUI

// MARK: - LinkButtonStyle

public struct LinkButtonStyle: ButtonStyle {

    // MARK: Lifecycle

    public init(foreground: ColorConfiguration) {
        self.foreground = foreground
    }

    // MARK: Public

    public func makeBody(configuration: Configuration) -> some View {
        InternalButton(configuration: configuration, foreground: foreground)
    }

    // MARK: Private

    private var foreground: ColorConfiguration
}

// MARK: LinkButtonStyle.InternalButton

extension LinkButtonStyle {
    struct InternalButton: View {

        // MARK: Lifecycle

        internal init(configuration: ButtonStyle.Configuration,
                      foreground: ColorConfiguration) {
            self.configuration = configuration
            self.foreground = foreground
        }

        // MARK: Internal

        let configuration: ButtonStyle.Configuration

        var foregroundColor: Color {
            if isEnabled {
                configuration.isPressed ? foreground.highlighted : foreground.normal
            } else {
                foreground.disabled
            }
        }

        var body: some View {
            configuration
                .label
                .style(.body14Semibold, color: foregroundColor)
        }

        // MARK: Private

        private var foreground: ColorConfiguration

        @Environment(\.isEnabled) private var isEnabled: Bool
    }
}
