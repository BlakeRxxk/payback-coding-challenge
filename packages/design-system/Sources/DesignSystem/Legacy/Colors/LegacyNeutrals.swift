import SwiftUI

// MARK: - Color.Neutrals (Legacy)

@available(*, deprecated, message: "Use UIColor.Neutrals instead. The SwiftUI palette is superseded by the UIKit design system and will be removed.")
extension Color {
    /// Colors used for backgrounds, text, dividers, etc.
    public enum Neutrals {
        public static let neutral1 = Color(red: 0.969, green: 0.969, blue: 0.969)
        public static let neutral2 = Color(red: 0.922, green: 0.922, blue: 0.922)
        public static let neutral3 = Color(red: 0.867, green: 0.867, blue: 0.867)
        public static let neutral4 = Color(red: 0.827, green: 0.827, blue: 0.827)
        public static let neutral5 = Color(red: 0.761, green: 0.761, blue: 0.761)
        public static let neutral6 = Color(red: 0.690, green: 0.690, blue: 0.690)
        public static let neutral7 = Color(red: 0.443, green: 0.443, blue: 0.443)
        public static let neutral8 = Color(red: 0.369, green: 0.369, blue: 0.369)
    }
}
