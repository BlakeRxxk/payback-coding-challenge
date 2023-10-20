import Foundation
import SwiftUI

// MARK: - Toast

public struct Toast: View {

    // MARK: Lifecycle

    public init(viewModel: Toast.ViewModel, action: @escaping () -> Void = { }) {
        self.viewModel = viewModel
        self.action = action
    }

    // MARK: Public

    public var body: some View {
        VStack(content: {
            Spacer()

            VStack {
                HStack(alignment: .center, spacing: 8) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.title).style(.body12Semibold, color: Color.Error.error2)
                        Text(viewModel.description).style(.body16Semibold)
                    }
                    Spacer()
                    Button {
                        action()
                    } label: {
                        Text(viewModel.actionTitle)
                    }.buttonStyle(LinkButton.makeDefaultStyle())
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            }
            .background(Color.Shades.shade1)
            .cornerRadius(12)
            .shadow(.drop)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color.Neutrals.neutral3, lineWidth: 1))
        })
    }

    // MARK: Private

    private let viewModel: Toast.ViewModel
    private let action: () -> Void
}
