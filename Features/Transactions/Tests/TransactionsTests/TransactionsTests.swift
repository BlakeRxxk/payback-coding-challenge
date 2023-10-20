import TransactionsAPI
import XCTest
@testable import TransactionsImplementation

// MARK: - TransactionsTests

final class TransactionsTests: XCTestCase {
    func testTransactionsInitialState() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionService())

        XCTAssertEqual(viewModel.state, TransactionsViewModel.State.idle)
        XCTAssertFalse(viewModel.hasError)
        XCTAssertEqual(viewModel.searchText, "")
        XCTAssertNil(viewModel.selectedCategory)
        XCTAssertFalse(viewModel.isFiltered)
    }

    func testTransactionsFetchState() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionService())

        Task {
            await viewModel.fetchTransactions()

            XCTAssertEqual(viewModel.state, TransactionsViewModel.State.transactions(MockTransactionService.mockData))
            XCTAssertFalse(viewModel.hasError)
            XCTAssertEqual(viewModel.searchText, "")
            XCTAssertNil(viewModel.selectedCategory)
            XCTAssertFalse(viewModel.isFiltered)
        }
    }

    func testTransactionsFailedFetchState() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionServiceWithFail())

        Task {
            await viewModel.fetchTransactions()

            XCTAssertEqual(viewModel.state, TransactionsViewModel.State.error)
            XCTAssertTrue(viewModel.hasError)
            XCTAssertEqual(viewModel.searchText, "")
            XCTAssertNil(viewModel.selectedCategory)
            XCTAssertFalse(viewModel.isFiltered)
        }
    }

    func testTransactionsCategorySelect() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionService())

        Task {
            await viewModel.fetchTransactions()

            XCTAssertEqual(viewModel.state, TransactionsViewModel.State.transactions(MockTransactionService.mockData))

            viewModel.select(category: Self.mockCategory)
            XCTAssertFalse(viewModel.hasError)
            XCTAssertEqual(viewModel.searchText, "")
            XCTAssertEqual(viewModel.selectedCategory, Self.mockCategory)
            XCTAssertTrue(viewModel.isFiltered)

            switch viewModel.state {
            case .transactions(let items):
                XCTAssertEqual(items.count, 1)
            default:
                XCTFail()
            }

            viewModel.select(category: Self.mockCategory)
            XCTAssertNil(viewModel.selectedCategory)

            switch viewModel.state {
            case .transactions(let items):
                XCTAssertEqual(items.count, 2)
            default:
                XCTFail()
            }
        }
    }

    func testTransactionsTextSearch() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionService())

        Task {
            await viewModel.fetchTransactions()

            XCTAssertEqual(viewModel.state, TransactionsViewModel.State.transactions(MockTransactionService.mockData))

            XCTAssertFalse(viewModel.hasError)
            XCTAssertEqual(viewModel.searchText, "")
            XCTAssertNil(viewModel.selectedCategory)

            viewModel.searchText = "OTTO"

            XCTAssertTrue(viewModel.isFiltered)

            switch viewModel.state {
            case .transactions(let items):
                XCTAssertEqual(items.count, 0)
            default:
                XCTFail()
            }

            viewModel.searchText = "REWE"

            switch viewModel.state {
            case .transactions(let items):
                XCTAssertEqual(items.count, 2)
            default:
                XCTFail()
            }
        }
    }

    func testTransactionsTextSearchWithCategory() throws {
        let viewModel = TransactionsViewModel(transactionsService: MockTransactionService())

        Task {
            await viewModel.fetchTransactions()

            XCTAssertEqual(viewModel.state, TransactionsViewModel.State.transactions(MockTransactionService.mockData))

            XCTAssertFalse(viewModel.hasError)
            XCTAssertEqual(viewModel.searchText, "")
            XCTAssertNil(viewModel.selectedCategory)

            viewModel.select(category: Self.mockCategory)
            viewModel.searchText = "REWE"

            switch viewModel.state {
            case .transactions(let items):
                XCTAssertTrue(viewModel.isFiltered)
                XCTAssertEqual(items.count, 1)
            default:
                XCTFail()
            }
        }
    }
}

extension TransactionsTests {
    static let mockCategory = Category(id: 1, title: "Category: 1", value: 1)
}
