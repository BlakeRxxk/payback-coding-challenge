import NetworkAPI
import PBCore
import SwiftUI
import TransactionsAPI

// MARK: - TransactionsDependency

public protocol TransactionsDependency: Dependency {
    var transactionsService: TransactionsService { get }
}

// MARK: - TransactionsComponent

public final class TransactionsComponent: Component<TransactionsDependency>, Viewable {

    // MARK: Public

    public var view: some View {
        NavigationView {
            TransactionsListScene(viewModel: transactionsViewModel)
        }
    }

    // MARK: Internal

    var transactionsViewModel: TransactionsViewModel {
        TransactionsViewModel(transactionsService: dependency.transactionsService)
    }
}
