import Foundation

// MARK: - Reducer

public protocol Reducer<Action, State>: Sendable {
    associatedtype Action
    associatedtype State: Equatable

    func bind() -> AnyEffect<Action>
    func reduce(state: inout State, action: Action) -> AnyEffect<Action>
}

extension Reducer where Action: Sendable {
    public func bind() -> AnyEffect<Action> {
        .none
    }
}
