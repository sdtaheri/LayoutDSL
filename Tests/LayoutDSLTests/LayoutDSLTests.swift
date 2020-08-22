import XCTest
@testable import LayoutDSL

final class LayoutDSLTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LayoutDSL().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
