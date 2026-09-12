import UIKit

// MARK: - ColorConfiguration

public struct ColorConfiguration {
    let normal: UIColor
    let highlighted: UIColor
    let disabled: UIColor

    public init(normal: UIColor, highlighted: UIColor, disabled: UIColor) {
        self.normal = normal
        self.highlighted = highlighted
        self.disabled = disabled
    }
}

// MARK: - ColorConfiguration + Defaults

extension ColorConfiguration {
    public static let link = ColorConfiguration(
        normal: UIColor.Shades.shade2,
        highlighted: UIColor.Neutrals.neutral7,
        disabled: UIColor.Neutrals.neutral5)
}
