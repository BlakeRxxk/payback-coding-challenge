import SwiftUI

// MARK: - Color.Primary (Legacy)

@available(*, deprecated, message: "Use UIColor.Primary instead. The SwiftUI palette is superseded by the UIKit design system and will be removed.")
extension Color {
    /// Colors used for logos and icons
    public enum Primary {
        public static let primary1 = Color(red: 0.965, green: 0.278, blue: 0.373)
        public static let primary2 = Color(red: 1, green: 0.22, blue: 0.361)
    }
}
