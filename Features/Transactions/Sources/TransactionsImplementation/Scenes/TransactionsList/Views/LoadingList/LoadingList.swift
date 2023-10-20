import PBUI
import SwiftUI

struct LoadingList: View {
    var body: some View {
        VStack {
            Spacer()
            EllipsesLoader()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.Neutrals.neutral3)
    }
}
