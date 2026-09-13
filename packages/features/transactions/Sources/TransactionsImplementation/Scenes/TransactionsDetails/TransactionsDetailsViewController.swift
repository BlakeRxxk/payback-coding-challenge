import Core
import DesignSystem
import UIKit

// MARK: - TransactionsDetailsViewControllable

protocol TransactionsDetailsViewControllable: ViewControllable {
    var onDismiss: (() -> Void)? { get set }

    func configure(with viewModel: TransactionsDetailsViewModel)
}

// MARK: - TransactionsDetailsViewController

final class TransactionsDetailsViewController: UIViewController, TransactionsDetailsViewControllable {

    // MARK: Internal

    var onDismiss: (() -> Void)?

    func configure(with viewModel: TransactionsDetailsViewModel) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        setUpContent()
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Shades.shade1
        title = Localized.title
        navigationItem.rightBarButtonItem = closeButton
        setUpLayout()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard isBeingDismissed || isMovingFromParent || (presentingViewController == nil && navigationController == nil) else {
            return
        }
        onDismiss?()
        onDismiss = nil
    }

    // MARK: Private

    private var viewModel: TransactionsDetailsViewModel?

    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    private lazy var closeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissScreen))
        button.tintColor = UIColor.Shades.shade2
        button.accessibilityLabel = Localized.close
        return button
    }()

    private func setUpLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 24, right: 24)
        contentStack.isLayoutMarginsRelativeArrangement = true

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentStack.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])
    }

    private func setUpContent() {
        for arrangedSubview in contentStack.arrangedSubviews { arrangedSubview.removeFromSuperview() }

        let titleLabel = UILabel()
        titleLabel.text = viewModel?.title
        titleLabel.style(.headerSemibold)
        titleLabel.numberOfLines = 0

        contentStack.addArrangedSubview(titleLabel)
        contentStack.setCustomSpacing(24, after: titleLabel)

        viewModel?.details.forEach {
            contentStack.addArrangedSubview(TransactionsDetailRowView(viewModel: $0))
        }
    }

    @objc
    private func dismissScreen() {
        dismiss(animated: true)
    }
}

// MARK: TransactionsDetailsViewController.Localized

extension TransactionsDetailsViewController {
    fileprivate enum Localized {
        static let title = "Transaction Details"
        static let close = "Close"
    }
}
