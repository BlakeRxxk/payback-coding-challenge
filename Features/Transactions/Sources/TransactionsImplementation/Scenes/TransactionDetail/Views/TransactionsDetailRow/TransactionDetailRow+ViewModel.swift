import Foundation
import SwiftUI

extension TransactionDetailRow {
    struct ViewModel: Identifiable {
        var id: String = UUID().uuidString
        let title: String
        let detail: String

        var styledTitle: AttributedString {
            var result = AttributedString(title)
            result.underlineStyle = Text.LineStyle(
                pattern: .solid, color: Color.Shades.shade2)
            return result
        }
    }
}
