import Foundation

public enum HTTPMethod: String, Sendable {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
}
