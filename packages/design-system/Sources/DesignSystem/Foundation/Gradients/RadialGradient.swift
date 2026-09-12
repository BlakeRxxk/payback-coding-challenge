import UIKit

// MARK: - RadialGradient

public enum RadialGradient {
    /// Approximates the SwiftUI `EllipticalGradient` assets (gradient1 == gradient3,
    /// gradient2 unused) with a Core Graphics radial gradient.
    @MainActor
    public static func makeImage(size: CGSize) -> UIImage {
        let colors = [
            UIColor(red: 0.780, green: 0.176, blue: 0.396, alpha: 1).cgColor,
            UIColor(red: 0.824, green: 0.216, blue: 0.376, alpha: 1).cgColor,
            UIColor(red: 0.824, green: 0.216, blue: 0.333, alpha: 1).cgColor,
        ] as CFArray
        let locations: [CGFloat] = [0, 0.484, 1]

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            guard
                let colorspace = CGColorSpace(name: CGColorSpace.sRGB),
                let gradient = CGGradient(colorsSpace: colorspace, colors: colors, locations: locations)
            else { return }

            let center = CGPoint(x: size.width * 0.99, y: 0)
            let radius = hypot(size.width, size.height)
            context.cgContext.drawRadialGradient(
                gradient,
                startCenter: center,
                startRadius: 0,
                endCenter: center,
                endRadius: radius,
                options: [])
        }
    }
}
