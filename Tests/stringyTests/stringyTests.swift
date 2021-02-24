import XCTest
import class Foundation.Bundle

final class StringyTests: XCTestCase {

    override func setUpWithError() throws {
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
    }

    enum Subcommand: String {
        case camelcase, snakecase, kebabcase
    }

    func test_camelcase() {
        let result = runProcess(subcommand: .camelcase, args: "Camel", "case", "string")

        switch result {
        case .success(let output):
            XCTAssertEqual("camelCaseString", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func test_invert_camelcase() {
        let result = runProcess(subcommand: .camelcase, args: "--invert", "camelCaseString")

        switch result {
        case .success(let output):
            XCTAssertEqual("camel case string", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func test_snakecase() {
        let result = runProcess(subcommand: .snakecase, args: "Snakes", "are", "SLITHERY")

        switch result {
        case .success(let output):
            XCTAssertEqual("snakes_are_slithery", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func test_invert_snakecase() {
        let result = runProcess(subcommand: .snakecase, args: "--invert", "snakes_are_slithery")

        switch result {
        case .success(let output):
            XCTAssertEqual("snakes are slithery", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func test_kebabcase() {
        let result = runProcess(subcommand: .kebabcase, args: "Words", "on", "a", "Stick")

        switch result {
        case .success(let output):
            XCTAssertEqual("words-on-a-stick", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    func test_invert_kebabcase() {
        let result = runProcess(subcommand: .kebabcase, args: "--invert", "words-on-a-stick")

        switch result {
        case .success(let output):
            XCTAssertEqual("words on a stick", output)
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
    }

    static var allTests = [
        ("test_camelcase", test_camelcase),
        ("test_invert_camelcase", test_invert_camelcase),

        ("test_snakecase", test_snakecase),
        ("test_invert_snakecase", test_invert_snakecase),

        ("test_kebabcase", test_kebabcase),
        ("test_invert_kebabcase", test_invert_kebabcase),
    ]

    private func runProcess(subcommand: Subcommand, args: String...) -> Result<String, Error> {
        let bin = productsDirectory.appendingPathComponent("stringy")
        let process = Process()
        process.executableURL = bin

        process.arguments = [subcommand.rawValue] + args

        let stdout = Pipe()
        process.standardOutput = stdout

        let stderr = Pipe()
        process.standardError = stderr

        do {
            try process.run()
            process.waitUntilExit()

            let data = stdout.fileHandleForReading.readDataToEndOfFile()

            let errData = stderr.fileHandleForReading.readDataToEndOfFile()

            if let errMssg = String(data: errData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) {
                guard errMssg.isEmpty else { throw(errMssg) }
            }

            guard let output = String(data: data, encoding: .utf8) else {
                throw("Output is nil")
            }

            return .success(output.trimmingCharacters(in: .newlines))

        } catch {
            return .failure(error)
        }
    }

    /// Returns path to the built products directory.
    private var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}

extension String: Error, LocalizedError {
    public var errorDescription: String? { return self }
}
