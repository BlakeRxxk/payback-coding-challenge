
import Foundation

public struct DateOutputFormatter: Formatter {
    public init() { }
    public func format(input: String) -> String? {
        guard let date = DateFactory.dateAndTimeInputFormatter.date(from: input) else { return nil }
        return DateFactory.dateOutputFormatter.string(from: date)
    }
}
