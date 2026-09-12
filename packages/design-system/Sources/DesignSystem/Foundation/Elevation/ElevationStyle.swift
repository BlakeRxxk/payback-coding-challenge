import UIKit

// MARK: - ElevationStyle

public enum ElevationStyle {
    /// opacity(0.17), radius: 9, x: 0, y: 4
    case drop
    /// opacity(0.19), radius: 2.5, x: 0, y: 1
    case hover
    /// opacity(0.12), radius: 8, x: 0, y: 6
    case highlight
}

// MARK: - UIView + ElevationStyle

extension UIView {
    public func applyShadow(_ style: ElevationStyle) {
        switch style {
        case .drop:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.17
            layer.shadowRadius = 9
            layer.shadowOffset = CGSize(width: 0, height: 4)

        case .hover:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.19
            layer.shadowRadius = 2.5
            layer.shadowOffset = CGSize(width: 0, height: 1)

        case .highlight:
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.12
            layer.shadowRadius = 8
            layer.shadowOffset = CGSize(width: 0, height: 6)
        }
    }
}
