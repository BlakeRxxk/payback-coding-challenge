import XCTest
@testable import PBCore

// MARK: - ComponentTests

final class ComponentTests: XCTestCase {
    func testComponentInitialization() throws {
        let dependency = DependencyMock()
        let component = Component(dependency: dependency)

        XCTAssertIdentical(component.dependency, dependency)
    }

    func testSharedMethod() {
        let component = Component(dependency: DependencyMock())
        let instance1: MyComponentType = component.shared { MyComponentType() }
        let instance2: MyComponentType = component.shared { MyComponentType() }
        XCTAssertTrue(instance1 === instance2)
    }
}

// MARK: - DependencyMock

class DependencyMock: Dependency { }

// MARK: - MyComponentType

class MyComponentType { }
