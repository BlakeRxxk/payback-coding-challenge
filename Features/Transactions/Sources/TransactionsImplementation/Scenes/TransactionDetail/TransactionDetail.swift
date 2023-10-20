import PBUI
import SwiftUI

// MARK: - TransactionDetail

struct TransactionDetail: View {

    // MARK: Lifecycle

    public init(viewModel: TransactionDetail.ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Internal

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.title)
                            .style(.headerSemibold)
                            .padding(.bottom, 24)
                        Spacer()
                    }
                    VStack(spacing: 16) {
                        ForEach(viewModel.details) {
                            TransactionDetailRow(model: $0)
                        }
                    }
                }
            }
            .navigationBarItems(
                trailing: Button("", systemImage: "xmark", action: dismissScreen)
                    .foregroundStyle(Color.Shades.shade2))
            .safeAreaInset(edge: .bottom) {
                PrimaryButton(title: "Back to Transactions List", isLoading: .constant(false), action: dismissScreen)
            }
            .padding(24)
            .navigationTitle(Localized.title)
        }
    }

    // MARK: Private

    @Environment(\.presentationMode) private var presentationMode
    private let viewModel: TransactionDetail.ViewModel

    private func dismissScreen() {
        presentationMode.wrappedValue.dismiss()
    }

}

// MARK: TransactionDetail.Localized

extension TransactionDetail {
    fileprivate enum Localized {
        static let title = "Transaction Details"
    }
}

#Preview {
    let details: [TransactionDetailRow.ViewModel] = [
        .init(title: "item 1", detail: "description 1"),
        .init(title: "item 2", detail: "description 2"),
    ]

    return TransactionDetail(
        viewModel:
        .init(
            title: "TransactionDetail",
            details: details))
}
