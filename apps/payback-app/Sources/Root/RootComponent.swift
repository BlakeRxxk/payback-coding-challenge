import Core
import NetworkingAPI

import TransactionsAPI
import TransactionsImplementation

import FeedImplementation

// MARK: - RootDependency

public protocol RootDependency: Dependency {
    var networkClient: HTTPClientProtocol { get }
}

// MARK: - RootComponent

class RootComponent: Component<RootDependency>, @unchecked Sendable {
    
    // MARK: Internal
    
    var transactionsService: TransactionsService {
        shared {
            TransactionsServiceImplementation(networkClient: dependency.networkClient)
        }
    }
}
