import UIKit

// MARK: - LinkButton

@MainActor
public final class LinkButton: UIButton {

    // MARK: Lifecycle

    public init(title: String, configuration: ColorConfiguration = .link, action: @escaping () -> Void = { }) {
        colorConfiguration = configuration
        self.action = action
        super.init(frame: .zero)
        setUp()
        setTitle(title, for: .normal)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private

    private let colorConfiguration: ColorConfiguration
    private let action: () -> Void

    private func setUp() {
        titleLabel?.font = UIFont.typography(.body14Semibold)
        setTitleColor(colorConfiguration.normal, for: .normal)
        setTitleColor(colorConfiguration.highlighted, for: .highlighted)
        setTitleColor(colorConfiguration.disabled, for: .disabled)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    @objc
    private func handleTap() {
        action()
    }
}
