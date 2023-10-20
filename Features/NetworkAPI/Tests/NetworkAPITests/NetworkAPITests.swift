import Foundation
import XCTest

@testable import NetworkAPI

// MARK: - NetworkAPITests

final class NetworkAPITests: XCTestCase {

    var httpClient: HTTPClient!

    override func setUp() async throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        httpClient = HTTPClient(configuration: configuration)
    }

    override func tearDown() async throws {
        httpClient = nil
    }

    func testRequest() async throws {
        MockURLProtocol.mockResponse = Data()
        MockURLProtocol.mockResponseCode = 200

        let parameters: [String: Any] = ["key": "value"]

        do {
            let (responseJSON, status) = try await httpClient.request(.get, MockAPIRoute.route1, parameters: parameters)

            XCTAssertEqual(status, .succeed)
            XCTAssertNotNil(responseJSON)
        } catch {
            XCTFail("Error occurred: \(error)")
        }
    }
}

// MARK: - MockAPIRoute

enum MockAPIRoute {
    /// Base API URL to create requests from
    static var baseURL = URL(staticString: "https://google.com")

    case route1
}

// MARK: Routable

extension MockAPIRoute: Routable {
    var extraHTTPHeaders: [String: String] {
        [:]
    }

    /// The URL string of the combined URL
    var url: URL {
        let path = switch self {
        case .route1:
            "/v1/route1"
        }

        // swiftlint:disable:next force_unwrapping
        return URL(string: path, relativeTo: MockAPIRoute.baseURL)!
    }
}

// MARK: - MockURLProtocol

class MockURLProtocol: URLProtocol {
    static var mockResponse: Data?
    static var mockResponseCode = 200

    override class func canInit(with _: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        if
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: Self.mockResponseCode,
                httpVersion: nil,
                headerFields: nil) {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }

        if let responseData = Self.mockResponse {
            client?.urlProtocol(self, didLoad: responseData)
        }

        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
