import SwiftUI

@available(*, deprecated, message: "Use UILabel.style from the UIKit design system instead.")
extension View {
    @inlinable
    public func style(_ style: TypographyStyle) -> some View {
        modifier(Typography(style: style)).foregroundColor(Color.Shades.shade2)
    }

    @inlinable
    public func style(_ style: TypographyStyle, color: Color) -> some View {
        modifier(Typography(style: style)).foregroundColor(color)
    }
}
