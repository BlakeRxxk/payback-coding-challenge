import UIKit

// MARK: - UILabel + TypographyStyle

extension UILabel {
    public func style(_ style: TypographyStyle) {
        font = UIFont.typography(style)
        textColor = UIColor.typography(style)
    }

    public func style(_ style: TypographyStyle, color: UIColor) {
        font = UIFont.typography(style)
        textColor = color
    }
}
