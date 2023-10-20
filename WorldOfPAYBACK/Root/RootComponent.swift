import PBCore
import NetworkAPI

import TransactionsAPI
import TransactionsImplementation

import FeedImplementation

// MARK: - RootDependency

public protocol RootDependency: Dependency {
    var networkClient: HTTPClientProtocol { get }
}

// MARK: - RootComponent

class RootComponent: Component<RootDependency> {
    
    // MARK: Internal
    
    var transactionsService: TransactionsService {
        shared {
            TransactionsServiceImplementation(networkClient: dependency.networkClient)
        }
    }
}
