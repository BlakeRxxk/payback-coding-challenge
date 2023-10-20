import Foundation
import PBCore
import NetworkAPI
import NetworkImplementation
import TransactionsAPI
import TransactionsImplementation

private let kRequestTimeout = 20.0

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
    
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

    var rootComponent: RootComponent {
        RootComponent(dependency: self)
    }
}

