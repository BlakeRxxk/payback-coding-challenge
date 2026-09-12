import SwiftUI

// MARK: - Elevation (Legacy)

@available(*, deprecated, message: "Use UIView.applyShadow from the UIKit design system instead.")
public struct Elevation: ViewModifier {

    // MARK: Lifecycle

    public init(style: ElevationStyle) {
        self.style = style
    }

    // MARK: Public

    public func body(content: Content) -> some View {
        switch style {
        case .drop: content.shadow(color: .black.opacity(0.17), radius: 9, x: 0, y: 4)
        case .hover:
            content.shadow(color: .black.opacity(0.19), radius: 2.5, x: 0, y: 1)
        case .highlight:
            content.shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
        }
    }

    // MARK: Internal

    var style: ElevationStyle
}
