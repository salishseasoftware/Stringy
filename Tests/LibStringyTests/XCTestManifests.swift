import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LibStringyTests.allTests),
        testCase(String+DataDetectorTests.allTests),
    ]
}
#endif
