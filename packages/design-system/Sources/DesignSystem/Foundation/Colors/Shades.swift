import SwiftUI

extension Color {
    /// Colors used for backgrounds, text, dividers, etc.
    public enum Shades {
        public static let shade1: Color = .white
        public static let shade2: Color = .init(red: 0.13, green: 0.13, blue: 0.13)
        /// shade2 with opacity 5%
        public static let shade3: Color = .init(red: 0.13, green: 0.13, blue: 0.13).opacity(0.05)
        /// shade2 with opacity 30%
        public static let shade4: Color = .init(red: 0.13, green: 0.13, blue: 0.13).opacity(0.3)
    }
}
