import PBCore
import TransactionsAPI
import TransactionsImplementation

extension RootComponent: TransactionsDependency {
    var transactions: TransactionsComponent {
        TransactionsComponent(dependency: self)
    }
}
