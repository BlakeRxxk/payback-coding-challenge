import SwiftUI

// MARK: - Color.Error (Legacy)

@available(*, deprecated, message: "Use UIColor.Error instead. The SwiftUI palette is superseded by the UIKit design system and will be removed.")
extension Color {
    /// Colored used for background and text of errors
    public enum Error {
        public static let error1 = Color(red: 0.996, green: 0.973, blue: 0.965)
        public static let error2 = Color(red: 0.757, green: 0.208, blue: 0.082)
    }
}
