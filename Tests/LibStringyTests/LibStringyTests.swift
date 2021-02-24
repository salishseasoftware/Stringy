import XCTest
@testable import LibStringy

final class LibStringyTests: XCTestCase {

    func test_firstLowercased() {
        XCTAssertEqual("fooBar", "FooBar".firstLowercased())
    }

    func test_firstUppercased() {
        XCTAssertEqual("FooBar", "fooBar".firstUppercased())
    }

    func test_firstCapitalized() {
        XCTAssertEqual("FooBar", "fooBar".firstCapitalized())
    }

    // "Camel Case String" -> "camelCaseString"
    func test_camelcased() {
        XCTAssertEqual("camelCaseString", "Camel case string".camelcased())
    }

    // "camelCaseString" -> "camel case string"
    func test_uncamelcased() {
        XCTAssertEqual("camel case string", "camelCaseString".uncamelcased())
    }

    // "Snakes are slithery" -> "snakes_are_slithery"
    func test_snakecased() {
        XCTAssertEqual("snakes_are_slithery", "Snakes are slithery".snakecased())
    }

    // "snakes_are_slithery" -> "snakes are slithery"
    func test_unsnakecased() {
        XCTAssertEqual("snakes are slithery", "snakes_are_slithery".unsnakecased())
    }

    // "Words on a stick" -> "words-on-a-stick"
    func test_kebabcased() {
        XCTAssertEqual("words-on-a-stick", "Words on a stick".kebabcased())
    }

    // "words-on-a-stick" -> "words on a stick"
    func test_unkebabcased() {
        XCTAssertEqual("words on a stick", "words-on-a-stick".unkebabcased())
    }

    static var allTests = [
        ("test_firstLowercased", test_firstLowercased),
        ("test_firstUppercased", test_firstUppercased),
        ("test_firstCapitalized", test_firstCapitalized),

        ("test_camelcased", test_camelcased),
        ("test_uncamelcased", test_uncamelcased),

        ("test_snakecased", test_snakecased),
        ("test_unsnakecased", test_unsnakecased),

        ("test_kebabcased", test_kebabcased),
        ("test_unkebabcased", test_unkebabcased),
    ]
}
