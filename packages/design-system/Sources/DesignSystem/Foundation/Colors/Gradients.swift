import SwiftUI

extension EllipticalGradient {
    /// Colors used for different primary button states
    public static let gradient1 = EllipticalGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.780, green: 0.176, blue: 0.396), location: 0.00),
            Gradient.Stop(color: Color(red: 0.824, green: 0.216, blue: 0.376), location: 0.484),
            Gradient.Stop(color: Color(red: 0.824, green: 0.216, blue: 0.333), location: 1.00),
        ],
        center: UnitPoint(x: 0.99, y: 0))
    public static let gradient2 = EllipticalGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.827, green: 0.216, blue: 0.325), location: 0.00),
            Gradient.Stop(color: Color(red: 0.820, green: 0.212, blue: 0.376), location: 0.528),
            Gradient.Stop(color: Color(red: 0.780, green: 0.176, blue: 0.396), location: 1.00),
        ],
        center: UnitPoint(x: -0.04, y: 1))
    public static let gradient3 = EllipticalGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.780, green: 0.176, blue: 0.396), location: 0.00),
            Gradient.Stop(color: Color(red: 0.824, green: 0.216, blue: 0.376), location: 0.484),
            Gradient.Stop(color: Color(red: 0.824, green: 0.216, blue: 0.333), location: 1.00),
        ],
        center: UnitPoint(x: 0.99, y: 0))
}
