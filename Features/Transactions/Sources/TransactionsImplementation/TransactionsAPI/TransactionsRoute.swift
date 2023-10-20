import Foundation
import NetworkAPI

// MARK: - TransactionsRoute

enum TransactionsRoute {
#if DEBUG
    static var baseURL = URL(staticString: "http://localhost:3000")
    // using local server for dev
    // static var baseURL = URL(staticString: "https://api-test.payback.com")
#elseif RELEASE
    static var baseURL = URL(staticString: "https://api.payback.com")
#endif

    case all
}

// MARK: Routable

extension TransactionsRoute: Routable {
    var url: URL {
        let path = switch self {
        case .all: "/transactions"
        }
        return URL(string: path, relativeTo: TransactionsRoute.baseURL)!
    }

    var extraHTTPHeaders: [String: String] {
        let extraHeaders: [String: String] = [:]

        return extraHeaders
    }
}
