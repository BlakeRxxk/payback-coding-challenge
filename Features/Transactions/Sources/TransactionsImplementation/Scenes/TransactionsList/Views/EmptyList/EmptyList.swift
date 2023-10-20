import Foundation
import SwiftUI

struct EmptyList: View {

    init(viewModel: EmptyList.ViewModel) {
        self.viewModel = viewModel
    }

    private let viewModel: EmptyList.ViewModel

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.title)
            Spacer()
        }
    }
}
