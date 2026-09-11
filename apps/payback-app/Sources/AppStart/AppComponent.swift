import Core
import FeedAPI
import FeedImplementation
import Foundation
import NeedleFoundation
import NetworkingAPI
import NetworkingImplementation
import TransactionsAPI
import TransactionsImplementation

private let kRequestTimeout = 20.0

final class AppComponent: NeedleFoundation.BootstrapComponent, TransactionsDependency, FeedDependency, @unchecked Sendable {

    // MARK: Internal

    var networkClient: HTTPClientProtocol {
        shared {
            let configuration = URLSessionConfiguration.ephemeral
            configuration.timeoutIntervalForRequest = kRequestTimeout
            /// this parameter is enabled exclusively for testing purposes
            configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            return HTTPClient(configuration: configuration, decoder: decoder)
        }
    }

    public var transactionsService: TransactionsService {
        shared {
            TransactionsServiceImplementation(networkClient: networkClient)
        }
    }

    var transactionsComponent: TransactionsComponent {
        shared {
            TransactionsComponent(parent: self)
        }
    }

    var feedComponent: FeedComponent {
        shared {
            FeedComponent(parent: self)
        }
    }
}