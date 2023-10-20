import Foundation

public protocol HTTPClientProtocol {
    init(configuration: URLSessionConfiguration, decoder: JSONDecoder)

    func request<T: Decodable>(_ method: HTTPMethod,
                               _ route: Routable,
                               parameters: [String: Any]?) async throws -> T
}
