

import Core
import FeedAPI
import FeedImplementation
import Foundation
import NeedleFoundation
import NetworkingAPI
import NetworkingImplementation
import SwiftUI
import TransactionsAPI
import TransactionsImplementation

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class FeedDependency048103b97140da991f3bProvider: FeedDependency {
    var transactionsService: TransactionsService {
        return appComponent.transactionsService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FeedComponent
private func factory3fd6e6b40c96e5f9c627f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FeedDependency048103b97140da991f3bProvider(appComponent: parent1(component) as! AppComponent)
}
private class TransactionsDependency7cc260358cdb20d37ad6Provider: TransactionsDependency {
    var transactionsService: TransactionsService {
        return appComponent.transactionsService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->TransactionsComponent
private func factory4ac77579a4e8feb34e95f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TransactionsDependency7cc260358cdb20d37ad6Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["transactionsService-TransactionsService"] = { [unowned self] in self.transactionsService as Any }
    }
}
extension FeedComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\FeedDependency.transactionsService] = "transactionsService-TransactionsService"
    }
}
extension TransactionsComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\TransactionsDependency.transactionsService] = "transactionsService-TransactionsService"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->FeedComponent", factory3fd6e6b40c96e5f9c627f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->TransactionsComponent", factory4ac77579a4e8feb34e95f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
