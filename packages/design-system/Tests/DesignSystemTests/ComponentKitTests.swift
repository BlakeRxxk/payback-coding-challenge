import UIKit
import XCTest
@testable import DesignSystem

// MARK: - ComponentKitTests

@MainActor
final class ComponentKitTests: XCTestCase {

    // MARK: Shades

    func testShades() {
        XCTAssertEqual(UIColor.Shades.shade1.rgba, [1, 1, 1, 1])
        XCTAssertEqual(UIColor.Shades.shade2.rgba, [0.133, 0.133, 0.133, 1])
        XCTAssertEqual(UIColor.Shades.shade3.rgba, [0.133, 0.133, 0.133, 0.05])
        XCTAssertEqual(UIColor.Shades.shade4.rgba, [0.133, 0.133, 0.133, 0.3])
    }

    // MARK: Neutrals

    func testNeutrals() {
        XCTAssertEqual(UIColor.Neutrals.neutral1.rgba, [0.969, 0.969, 0.969, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral2.rgba, [0.922, 0.922, 0.922, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral3.rgba, [0.867, 0.867, 0.867, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral4.rgba, [0.827, 0.827, 0.827, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral5.rgba, [0.761, 0.761, 0.761, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral6.rgba, [0.69, 0.69, 0.69, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral7.rgba, [0.443, 0.443, 0.443, 1])
        XCTAssertEqual(UIColor.Neutrals.neutral8.rgba, [0.369, 0.369, 0.369, 1])
    }

    // MARK: Accents

    func testAccents() {
        XCTAssertEqual(UIColor.Accents.accent1.rgba, [0.965, 0.843, 0.875, 1])
        XCTAssertEqual(UIColor.Accents.accent2.rgba, [0.816, 0.212, 0.376, 1])
        XCTAssertEqual(UIColor.Accents.discount.rgba, [0, 0.541, 0.02, 1])
        XCTAssertEqual(UIColor.Accents.link.rgba, [0, 0.298, 0.769, 1])
    }

    func testPrimary() {
        XCTAssertEqual(UIColor.Primary.primary1.rgba, [0.965, 0.278, 0.373, 1])
        XCTAssertEqual(UIColor.Primary.primary2.rgba, [1, 0.22, 0.361, 1])
    }

    // MARK: Error

    func testError() {
        XCTAssertEqual(UIColor.Error.error1.rgba, [0.996, 0.973, 0.965, 1])
        XCTAssertEqual(UIColor.Error.error2.rgba, [0.757, 0.208, 0.082, 1])
    }

    // MARK: Typography

    func testTypographyPointSizes() {
        XCTAssertEqual(UIFont.typography(.headerRegular).pointSize, 22)
        XCTAssertEqual(UIFont.typography(.headerSemibold).pointSize, 22)
        XCTAssertEqual(UIFont.typography(.body18Regular).pointSize, 18)
        XCTAssertEqual(UIFont.typography(.body18Medium).pointSize, 18)
        XCTAssertEqual(UIFont.typography(.body18Semibold).pointSize, 18)
        XCTAssertEqual(UIFont.typography(.body16Regular).pointSize, 16)
        XCTAssertEqual(UIFont.typography(.body16Medium).pointSize, 16)
        XCTAssertEqual(UIFont.typography(.body16Semibold).pointSize, 16)
        XCTAssertEqual(UIFont.typography(.body14Regular).pointSize, 14)
        XCTAssertEqual(UIFont.typography(.body14Semibold).pointSize, 14)
        XCTAssertEqual(UIFont.typography(.body13Regular).pointSize, 13)
        XCTAssertEqual(UIFont.typography(.body13Semibold).pointSize, 13)
        XCTAssertEqual(UIFont.typography(.body12Regular).pointSize, 12)
        XCTAssertEqual(UIFont.typography(.body12Medium).pointSize, 12)
        XCTAssertEqual(UIFont.typography(.body12Semibold).pointSize, 12)
        XCTAssertEqual(UIFont.typography(.micro).pointSize, 10)
    }

    func testTypographyDefaultColorIsShade2() {
        XCTAssertEqual(UIColor.typography(.body16Regular).rgba, UIColor.Shades.shade2.rgba)
    }

    // MARK: Loader

    func testEllipsesLoaderIntrinsicContentSize() {
        let loader = EllipsesLoader()
        XCTAssertEqual(loader.intrinsicContentSize, CGSize(width: 36, height: 16))
    }

    // MARK: Button

    func testPrimaryButtonDefaultState() {
        let button = PrimaryButton(title: "Title")

        XCTAssertEqual(button.title(for: .normal), "Title")
        XCTAssertFalse(button.isLoading)
        XCTAssertTrue(button.isEnabled)
    }
}

// MARK: - UIColor + rgba

extension UIColor {
    var rgba: [CGFloat] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return [red, green, blue, alpha].map { ($0 * 1000).rounded() / 1000 }
    }
}
