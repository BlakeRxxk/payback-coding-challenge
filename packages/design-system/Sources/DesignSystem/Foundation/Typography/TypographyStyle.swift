import UIKit

// MARK: - TypographyStyle

public enum TypographyStyle {
    case headerRegular
    case headerSemibold

    case body18Regular
    case body18Medium
    case body18Semibold

    case body16Regular
    case body16Medium
    case body16Semibold

    case body14Regular
    case body14Semibold

    case body13Regular
    case body13Semibold

    case body12Regular
    case body12Medium
    case body12Semibold

    case micro
}

// MARK: - UIFont + TypographyStyle

extension UIFont {
    public static func typography(_ style: TypographyStyle) -> UIFont {
        switch style {
        case .headerRegular: .systemFont(ofSize: 22, weight: .regular)
        case .headerSemibold: .systemFont(ofSize: 22, weight: .semibold)
        case .body18Regular: .systemFont(ofSize: 18, weight: .regular)
        case .body18Medium: .systemFont(ofSize: 18, weight: .medium)
        case .body18Semibold: .systemFont(ofSize: 18, weight: .semibold)
        case .body16Regular: .systemFont(ofSize: 16, weight: .regular)
        case .body16Medium: .systemFont(ofSize: 16, weight: .medium)
        case .body16Semibold: .systemFont(ofSize: 16, weight: .semibold)
        case .body14Regular: .systemFont(ofSize: 14, weight: .regular)
        case .body14Semibold: .systemFont(ofSize: 14, weight: .semibold)
        case .body13Regular: .systemFont(ofSize: 13, weight: .regular)
        case .body13Semibold: .systemFont(ofSize: 13, weight: .semibold)
        case .body12Regular: .systemFont(ofSize: 12, weight: .regular)
        case .body12Medium: .systemFont(ofSize: 12, weight: .medium)
        case .body12Semibold: .systemFont(ofSize: 12, weight: .semibold)
        case .micro: .systemFont(ofSize: 10, weight: .semibold)
        }
    }
}

// MARK: - UIColor + TypographyStyle

extension UIColor {
    /// Default foreground color used by `UILabel.style(_:)`.
    public static func typography(_ style: TypographyStyle) -> UIColor {
        _ = style
        return UIColor.Shades.shade2
    }
}
