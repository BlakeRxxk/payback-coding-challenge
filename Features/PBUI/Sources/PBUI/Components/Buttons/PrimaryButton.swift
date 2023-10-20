import SwiftUI

public struct PrimaryButton: View {

    // MARK: Lifecycle

    public init(title: String,
                isLoading: Binding<Bool>,
                action: @escaping () -> Void) {
        _isLoading = isLoading
        self.action = action
        self.title = title
    }

    // MARK: Public

    public var body: some View {
        Button {
            guard !isLoading else { return }
            isLoading = true
            action()

        } label: {
            Text(title).frame(maxWidth: .infinity)
        }
        .isLoading(isLoading)
        .buttonStyle(PrimaryButtonStyle())
    }

    // MARK: Internal

    let title: String
    var action: () -> Void = { }

    @Binding var isLoading: Bool
}

#Preview {
    Group {
        PrimaryButton(
            title: "Preview Title",
            isLoading: .constant(false)) {
                // action
            }

        PrimaryButton(
            title: "Preview Loading",
            isLoading: .constant(true)) {
                // action
            }

        PrimaryButton(
            title: "Preview Disabled",
            isLoading: .constant(false)) {
                // action
            }.disabled(true)
    }
}
