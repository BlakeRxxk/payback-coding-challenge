import Foundation

// MARK: - Dependency

public protocol Dependency: AnyObject, Sendable { }

// MARK: - EmptyDependency

public protocol EmptyDependency: Dependency { }
