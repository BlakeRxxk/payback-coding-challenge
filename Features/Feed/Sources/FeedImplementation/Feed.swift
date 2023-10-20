import PBCore
import SwiftUI
import TransactionsAPI

// MARK: - FeedDependency

public protocol FeedDependency: Dependency {
    var transactionsService: TransactionsService { get }
}

// MARK: - FeedComponent

public final class FeedComponent: Component<FeedDependency>, Viewable {

    // MARK: Public

    public var view: some View {
        Text("Placeholder for Feed Feature")
    }

    // MARK: Internal

    var transactionsViewModel: FeedViewModel {
        FeedViewModel(transactionsService: dependency.transactionsService)
    }
}
