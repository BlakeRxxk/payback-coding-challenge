import Foundation
import PBCore
import SwiftUI

struct TotalAmount: View {

    // MARK: Lifecycle

    init(viewModel: TotalAmount.ViewModel, isPanelVisible: Binding<Bool>) {
        self.viewModel = viewModel
        _isPanelVisible = isPanelVisible
    }

    // MARK: Internal

    let viewModel: TotalAmount.ViewModel
    @Binding var isPanelVisible: Bool

    var body: some View {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
            VStack {
                HStack(content: {
                    Text(viewModel.title + " (\(viewModel.currency))").style(.body16Semibold)
                    Spacer()
                    Text(viewModel.totalAmount).style(.body16Semibold, color: Color.Accents.accent2)
                })
                .padding(24)
            }
            .frame(maxWidth: .infinity)
            .background(ignoresSafeAreaEdges: .bottom)
            .background(
                Color.Shades.shade1.shadow(.highlight))
            .offset(y: isPanelVisible ? 0 : 120)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }
}
