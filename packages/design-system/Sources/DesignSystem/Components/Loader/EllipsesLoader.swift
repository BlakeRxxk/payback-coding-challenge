import UIKit

// MARK: - EllipsesLoader

@MainActor
public final class EllipsesLoader: UIView {

    // MARK: Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public

    public private(set) var isAnimating = false

    public override var intrinsicContentSize: CGSize {
        let dotsWidth = CGFloat(EllipsesLoader.dotsCount) * EllipsesLoader.dotDiameter
            + CGFloat(EllipsesLoader.dotsCount - 1) * EllipsesLoader.spacing
        let height = EllipsesLoader.dotDiameter + 2 * EllipsesLoader.verticalPadding
        return CGSize(width: dotsWidth, height: height)
    }

    public func startAnimating() {
        guard !isAnimating else { return }
        isAnimating = true
        addAnimations()
    }

    public func stopAnimating() {
        guard isAnimating else { return }
        isAnimating = false
        for dot in dots { dot.removeAllAnimations() }
    }

    // MARK: UIView

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            startAnimating()
        } else {
            stopAnimating()
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let totalWidth = intrinsicContentSize.width
        var x = (bounds.width - totalWidth) / 2
        let y = (bounds.height - Self.dotDiameter) / 2
        for dot in dots {
            dot.frame = CGRect(x: x, y: y, width: Self.dotDiameter, height: Self.dotDiameter)
            x += Self.dotDiameter + Self.spacing
        }
    }

    // MARK: Private

    // MARK: Private Static

    private static let dotsCount = 3
    private static let dotDiameter: CGFloat = 8
    private static let verticalPadding: CGFloat = 4
    private static let spacing: CGFloat = 6
    private static let scaleFactor: CGFloat = 1.2
    private static let scaleDelay: TimeInterval = 0.4
    private static let scaleDuration: CFTimeInterval = 1.0
    private static let colorDuration: CFTimeInterval = 2.0
    private static let colors: [UIColor] = [
        UIColor.Neutrals.neutral1,
        UIColor.Neutrals.neutral2,
        UIColor.Neutrals.neutral2,
    ]

    private let dots: [CALayer] = (0 ..< EllipsesLoader.dotsCount).map { _ in
        let layer = CALayer()
        layer.backgroundColor = EllipsesLoader.colors[0].cgColor
        layer.cornerRadius = EllipsesLoader.dotDiameter / 2
        return layer
    }

    private func setUp() {
        backgroundColor = .clear
        dots.forEach(layer.addSublayer)
    }

    private func addAnimations() {
        let now = CACurrentMediaTime()
        for (index, dot) in dots.enumerated() {
            addScaleAnimation(to: dot, beginTime: now + Double(index) * Self.scaleDelay)
            addColorAnimation(to: dot, beginTime: now)
        }
    }

    private func addScaleAnimation(to dot: CALayer, beginTime: CFTimeInterval) {
        dot.removeAnimation(forKey: "scale")
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = Self.scaleFactor
        animation.duration = Self.scaleDuration
        animation.beginTime = beginTime
        animation.autoreverses = false
        animation.repeatCount = .infinity
        dot.add(animation, forKey: "scale")
    }

    private func addColorAnimation(to dot: CALayer, beginTime: CFTimeInterval) {
        dot.removeAnimation(forKey: "color")
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = Self.colors.map(\.cgColor)
        animation.duration = Self.colorDuration
        animation.beginTime = beginTime
        animation.autoreverses = true
        animation.repeatCount = .infinity
        dot.add(animation, forKey: "color")
    }

}
