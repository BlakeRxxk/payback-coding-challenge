import SwiftUI

// MARK: - Typography (Legacy)

@available(*, deprecated, message: "Use UIFont.typography / UILabel.style from the UIKit design system instead.")
public struct Typography: ViewModifier {

    // MARK: Lifecycle

    public init(style: TypographyStyle) {
        self.style = style
    }

    // MARK: Public

    public func body(content: Content) -> some View {
        switch style {
        case .headerRegular: return content.font(Font.system(size: 22, weight: .regular))
        case .headerSemibold: return content.font(Font.system(size: 22, weight: .semibold))
        case .body18Regular: return content.font(Font.system(size: 18, weight: .regular))
        case .body18Medium: return content.font(Font.system(size: 18, weight: .medium))
        case .body18Semibold: return content.font(Font.system(size: 18, weight: .semibold))
        case .body16Regular: return content.font(Font.system(size: 16, weight: .regular))
        case .body16Medium: return content.font(Font.system(size: 16, weight: .medium))
        case .body16Semibold: return content.font(Font.system(size: 16, weight: .semibold))
        case .body14Regular: return content.font(Font.system(size: 14, weight: .regular))
        case .body14Semibold: return content.font(Font.system(size: 14, weight: .semibold))
        case .body13Regular: return content.font(Font.system(size: 13, weight: .regular))
        case .body13Semibold: return content.font(Font.system(size: 13, weight: .semibold))
        case .body12Regular: return content.font(Font.system(size: 12, weight: .regular))
        case .body12Medium: return content.font(Font.system(size: 12, weight: .medium))
        case .body12Semibold: return content.font(Font.system(size: 12, weight: .semibold))
        case .micro: return content.font(Font.system(size: 10, weight: .semibold))
        }
    }

    // MARK: Internal

    var style: TypographyStyle
}
