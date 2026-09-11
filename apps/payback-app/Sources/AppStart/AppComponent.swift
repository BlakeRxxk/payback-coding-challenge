import Core
import Foundation
import NeedleFoundation
import NetworkingAPI
import NetworkingImplementation

private let kRequestTimeout = 20.0

final class AppComponent: NeedleFoundation.BootstrapComponent, RootDependency, @unchecked Sendable {

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
}