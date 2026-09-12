import SwiftUI

@available(*, deprecated, message: "Use UIView.applyShadow from the UIKit design system instead.")
extension View {
    @inlinable
    public func shadow(_ style: ElevationStyle = .highlight) -> some View {
        modifier(Elevation(style: style))
    }
}
