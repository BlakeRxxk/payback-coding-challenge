import UIKit

// MARK: - PrimaryButton

@MainActor
public final class PrimaryButton: UIButton {

    // MARK: Lifecycle

    public init(title: String, isLoading: Bool = false, action: @escaping () -> Void) {
        self.action = action
        self.isLoading = isLoading
        super.init(frame: .zero)
        setUp()
        setTitle(title, for: .normal)
        updateState()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public

    public var isLoading: Bool {
        didSet { updateState() }
    }

    public override var isEnabled: Bool {
        didSet { updateState() }
    }

    // MARK: UIButton

    public override var isHighlighted: Bool {
        didSet { updateState() }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.frame = bounds
        pressedOverlayView.frame = bounds
        refreshGradientIfNeeded()
    }

    public override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        coordinator.addCoordinatedAnimations {
            self.layer.borderWidth = self.isFocused ? Self.ringWidth : 0
        }
    }

    // MARK: Private

    // MARK: Private Static

    private static let cornerRadius: CGFloat = 8
    private static let ringWidth: CGFloat = 2

    private let action: () -> Void
    private let gradientView = UIImageView()
    private let pressedOverlayView = UIView()
    private let loader = EllipsesLoader()
    private var gradientImageSize = CGSize.zero

    private func setUp() {
        layer.cornerRadius = Self.cornerRadius
        layer.borderColor = UIColor.Accents.link.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        titleLabel?.font = UIFont.typography(.body13Semibold)
        setTitleColor(UIColor.Shades.shade1, for: .normal)
        accessibilityTraits = .button

        gradientView.layer.cornerRadius = Self.cornerRadius
        gradientView.layer.masksToBounds = true

        pressedOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        pressedOverlayView.layer.cornerRadius = Self.cornerRadius
        pressedOverlayView.layer.masksToBounds = true
        pressedOverlayView.alpha = 0

        loader.isHidden = true
        loader.translatesAutoresizingMaskIntoConstraints = false

        addSubview(gradientView)
        addSubview(pressedOverlayView)
        addSubview(loader)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])

        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    @objc
    private func handleTap() {
        guard !isLoading else { return }
        isLoading = true
        action()
    }

    private func updateState() {
        let showsGradient = isEnabled && !isLoading
        gradientView.isHidden = !showsGradient
        pressedOverlayView.isHidden = !showsGradient
        if showsGradient {
            pressedOverlayView.alpha = isHighlighted ? 1 : 0
        }
        backgroundColor = showsGradient ? .clear : UIColor.Neutrals.neutral3
        loader.isHidden = !isLoading
        if isLoading {
            loader.startAnimating()
        } else {
            loader.stopAnimating()
        }
        titleLabel?.alpha = (isEnabled && !isLoading) ? 1 : 0.4
    }

    private func refreshGradientIfNeeded() {
        guard bounds.size != gradientImageSize, bounds.width > 0, bounds.height > 0 else { return }
        gradientImageSize = bounds.size
        gradientView.image = RadialGradient.makeImage(size: bounds.size)
    }

}
