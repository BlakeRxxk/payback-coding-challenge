import DesignSystem
import SwiftUI

struct LoadingList: View {
    var body: some View {
        VStack {
            Spacer()
            LegacyEllipsesLoader()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.Neutrals.neutral3)
    }
}
