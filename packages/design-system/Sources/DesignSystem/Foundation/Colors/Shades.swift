import UIKit

// MARK: - UIColor.Shades

extension UIColor {
    /// Colors used for backgrounds, text, dividers, etc.
    public enum Shades {
        public static let shade1 = UIColor.white
        public static let shade2 = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
        /// shade2 with opacity 5%
        public static let shade3 = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 0.05)
        /// shade2 with opacity 30%
        public static let shade4 = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 0.3)
    }
}
