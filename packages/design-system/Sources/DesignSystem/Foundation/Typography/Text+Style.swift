import SwiftUI

extension View {
    @inlinable
    public func style(_ style: Typography.Style) -> some View {
        modifier(Typography(style: style)).foregroundColor(Color.Shades.shade2)
    }

    @inlinable
    public func style(_ style: Typography.Style, color: Color) -> some View {
        modifier(Typography(style: style)).foregroundColor(color)
    }
}
