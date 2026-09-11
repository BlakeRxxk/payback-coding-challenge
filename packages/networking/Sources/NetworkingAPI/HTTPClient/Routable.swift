import Foundation

public protocol Routable: Sendable {
    var url: URL { get }
    var extraHTTPHeaders: [String: String] { get }
}
