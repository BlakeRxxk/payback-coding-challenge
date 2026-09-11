import Foundation

// MARK: - Component

// `@unchecked Sendable` is required: `sharedInstances` is a mutable dictionary guarded by
// `NSRecursiveLock`, so the class is thread-safe in a way the compiler cannot verify.
// swiftlint:disable:next no_unchecked_sendable
open class Component<DependencyType>: Dependency, @unchecked Sendable {

    // MARK: Lifecycle

    public init(dependency: DependencyType) {
        self.dependency = dependency
    }

    // MARK: Public

    public let dependency: DependencyType

    public final func shared<T>(__function: String = #function, _ factory: () -> T) -> T {
        lock.lock()
        defer {
            lock.unlock()
        }
        if let instance = (sharedInstances[__function] as? T?) ?? nil {
            return instance
        }

        let instance = factory()
        sharedInstances[__function] = instance

        return instance
    }

    // MARK: Private

    private var sharedInstances = [String: Any]()
    private let lock = NSRecursiveLock()
}

// MARK: - EmptyComponent

open class EmptyComponent: EmptyDependency {
    public init() { }
}
