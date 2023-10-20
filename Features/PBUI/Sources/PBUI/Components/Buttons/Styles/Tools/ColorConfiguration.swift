import SwiftUI

public struct ColorConfiguration {
    public let normal: Color
    public let highlighted: Color
    public let disabled: Color

    public init(normal: Color,
                highlighted: Color,
                disabled: Color) {
        self.normal = normal
        self.highlighted = highlighted
        self.disabled = disabled
    }

}
