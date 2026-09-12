import DesignSystem
import UIKit

// MARK: - TransactionsDetailRowView

final class TransactionsDetailRowView: UIView {

    // MARK: Lifecycle

    init(viewModel: TransactionsDetailRowViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private

    private let viewModel: TransactionsDetailRowViewModel
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()

    private func setUp() {
        titleLabel.attributedText = NSAttributedString(
            string: viewModel.title,
            attributes: [
                .font: UIFont.typography(.body16Regular),
                .foregroundColor: UIColor.Shades.shade2,
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .underlineColor: UIColor.Shades.shade2,
            ])
        titleLabel.numberOfLines = 0
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        detailLabel.text = viewModel.detail
        detailLabel.style(.body16Regular)
        detailLabel.numberOfLines = 0
        detailLabel.setContentHuggingPriority(.required, for: .horizontal)
        detailLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        addSubview(titleLabel)
        addSubview(detailLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: detailLabel.leadingAnchor, constant: -8),

            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8),
        ])
    }
}
