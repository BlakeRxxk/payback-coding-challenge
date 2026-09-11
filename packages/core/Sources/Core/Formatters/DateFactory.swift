import Foundation

public enum DateFactory {

    // MARK: Public

    public static let dateOutputFormatter: DateFormatter = {
        $0.dateFormat = "d MMMM y"
        return $0
    }(DateFormatter())

    public static let dateAndTimeInputFormatter: DateFormatter = {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        $0.locale = Locale(identifier: "en_US_POSIX")
        return $0
    }(DateFormatter())
}
