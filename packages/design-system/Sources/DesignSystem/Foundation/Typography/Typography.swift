import SwiftUI

// MARK: - Typography

public struct Typography: ViewModifier {
    
    // MARK: Public
    
    public enum Style {
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
    
    public init(style: Style) {
        self.style = style
    }
    
    // MARK: Internal
    
    internal var style: Style
}
