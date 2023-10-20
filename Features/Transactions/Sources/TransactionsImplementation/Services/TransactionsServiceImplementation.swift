import Foundation
import NetworkAPI
import TransactionsAPI

// MARK: - TransactionsServiceImplementation

public final class TransactionsServiceImplementation {

    // MARK: Lifecycle

    public init(networkClient: HTTPClientProtocol) {
        self.networkClient = networkClient
    }

    // MARK: Private

    private let networkClient: HTTPClientProtocol
}

// MARK: TransactionsService

extension TransactionsServiceImplementation: TransactionsService {
    public func fetchTansactions() async throws -> [PBTransaction] {
        let responseObject: TransactionsResponse = try await networkClient.request(.get, TransactionsRoute.all, parameters: nil)
        let sortedItems = responseObject.items.sorted(by: { lhs, rhs in
            lhs.transactionDetail.bookingDate < rhs.transactionDetail.bookingDate
        })
        return sortedItems
    }
}
