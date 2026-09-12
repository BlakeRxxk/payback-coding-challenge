import UIKit

// MARK: - Toast

@MainActor
public final class Toast: UIView {

    // MARK: Lifecycle

    public init(viewModel: ViewModel, action: @escaping () -> Void = { }) {
        self.viewModel = viewModel
        self.action = action
        super.init(frame: .zero)
        setUp()
        apply(viewModel)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public

    public private(set) var viewModel: ViewModel

    public func configure(with viewModel: ViewModel) {
        self.viewModel = viewModel
        apply(viewModel)
    }

    // MARK: Private

    private let action: () -> Void
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private lazy var actionButton = LinkButton(title: viewModel.actionTitle, action: action)
    private let textStack = UIStackView()
    private let contentStack = UIStackView()

    private func setUp() {
        backgroundColor = UIColor.Shades.shade1
        layer.cornerRadius = 12
        layer.borderColor = UIColor.Neutrals.neutral3.cgColor
        layer.borderWidth = 1
        applyShadow(.drop)

        titleLabel.style(.body12Semibold, color: UIColor.Error.error2)
        titleLabel.numberOfLines = 0
        descriptionLabel.style(.body16Semibold)
        descriptionLabel.numberOfLines = 0
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(descriptionLabel)
        textStack.axis = .vertical
        textStack.alignment = .leading
        textStack.spacing = 2
        textStack.setContentHuggingPriority(.defaultLow, for: .horizontal)

        contentStack.addArrangedSubview(textStack)
        contentStack.addArrangedSubview(actionButton)
        contentStack.axis = .horizontal
        contentStack.alignment = .center
        contentStack.spacing = 8
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)

        contentStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func apply(_ viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        actionButton.setTitle(viewModel.actionTitle, for: .normal)
    }
}
