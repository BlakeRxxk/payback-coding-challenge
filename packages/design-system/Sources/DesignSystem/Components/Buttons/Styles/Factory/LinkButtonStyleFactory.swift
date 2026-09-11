import SwiftUI

public typealias LinkButton = LinkButtonStyleFactory

// MARK: - LinkButtonStyleFactory

public enum LinkButtonStyleFactory {
    public static func makeDefaultStyle() -> LinkButtonStyle {
        LinkButtonStyle(
            foreground:
            .init(
                normal: Color.Shades.shade2,
                highlighted: Color.Neutrals.neutral7,
                disabled: Color.Neutrals.neutral5))
    }
}
