import Foundation
import SwiftUI

struct TransactionDetailRow: View {

    public init(model: TransactionDetailRow.ViewModel) {
        viewModel = model
    }

    private let viewModel: TransactionDetailRow.ViewModel

    var body: some View {
        HStack {
            Text(viewModel.styledTitle)
                .style(.body16Regular)

            Spacer()
            Text(viewModel.detail).style(.body16Regular)
        }
    }
}

#Preview {
    TransactionDetailRow(
        model:
        .init(
            title: "Title",
            detail: "Description"))
        .padding(24)
}
