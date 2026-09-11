import Foundation

// MARK: - Reducer

public protocol Reducer<Action, State>: Sendable {
    associatedtype Action: Sendable
    associatedtype State: Equatable & Sendable

    func bind() -> AnyEffect<Action>
    func reduce(state: inout State, action: Action) -> AnyEffect<Action>
}

extension Reducer where Action: Sendable {
    public func bind() -> AnyEffect<Action> {
        .none
    }
}
