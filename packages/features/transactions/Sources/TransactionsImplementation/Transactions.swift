import Core
import NeedleFoundation
import TransactionsAPI

// MARK: - TransactionsDependency

public protocol TransactionsDependency: NeedleFoundation.Dependency {
    var transactionsService: TransactionsService { get }
}

// MARK: - TransactionsComponent

public final class TransactionsComponent: NeedleFoundation.Component<TransactionsDependency>, TransactionsDependency {

    // MARK: Lifecycle

    public override init(parent: NeedleFoundation.Scope) {
        super.init(parent: parent)
    }

    // MARK: Public

    public var transactionsService: TransactionsService {
        dependency.transactionsService
    }

    // MARK: Internal

    @MainActor
    var transactionsViewModel: TransactionsViewModel {
        shared {
            TransactionsViewModel(transactionsService: transactionsService)
        }
    }
}
