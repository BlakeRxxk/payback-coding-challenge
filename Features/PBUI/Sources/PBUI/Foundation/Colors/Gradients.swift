import SwiftUI

extension EllipticalGradient {
    /// Colors used for different primary button states
    public static let gradient1: EllipticalGradient = .init(
        stops: [
            Gradient.Stop(color: Color(red: 0.92, green: 0.3, blue: 0.38), location: 0.00),
            Gradient.Stop(color: Color(red: 0.92, green: 0.3, blue: 0.38), location: 0.48),
            Gradient.Stop(color: Color(red: 0.92, green: 0.3, blue: 0.38), location: 1.00),
        ],
        center: UnitPoint(x: 0.99, y: 0))
    public static let gradient2 = EllipticalGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.83, green: 0.22, blue: 0.33), location: 0.00),
            Gradient.Stop(color: Color(red: 0.82, green: 0.21, blue: 0.38), location: 0.53),
            Gradient.Stop(color: Color(red: 0.78, green: 0.18, blue: 0.4), location: 1.00),
        ],
        center: UnitPoint(x: -0.04, y: 1))
    public static let gradient3 = EllipticalGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.78, green: 0.18, blue: 0.4), location: 0.00),
            Gradient.Stop(color: Color(red: 0.82, green: 0.22, blue: 0.38), location: 0.48),
            Gradient.Stop(color: Color(red: 0.82, green: 0.22, blue: 0.33), location: 1.00),
        ],
        center: UnitPoint(x: 0.99, y: 0))
}
