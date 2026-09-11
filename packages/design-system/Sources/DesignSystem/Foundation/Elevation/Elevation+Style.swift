import SwiftUI

extension View {
    @inlinable
    public func shadow(_ style: Elevation.Style = .highlight) -> some View {
        modifier(Elevation(style: style))
    }
}
