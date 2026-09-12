import SwiftUI

// MARK: - Color.Accents (Legacy)

@available(*, deprecated, message: "Use UIColor.Accents instead. The SwiftUI palette is superseded by the UIKit design system and will be removed.")
extension Color {
    /// Colors used for icons, links.
    public enum Accents {
        public static let accent1 = Color(red: 0.965, green: 0.843, blue: 0.875)
        public static let accent2 = Color(red: 0.816, green: 0.212, blue: 0.376)
        public static let discount = Color(red: 0, green: 0.541, blue: 0.02)
        public static let link = Color(red: 0, green: 0.298, blue: 0.769)
    }
}
