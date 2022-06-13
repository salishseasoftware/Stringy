import Foundation
import ArgumentParser
import LibStringy

struct Stringy: ParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "Handy string conversions",
        subcommands: [
            CamelCase.self,
            SnakeCase.self,
            KebabCase.self,
        ]
    )

    struct Options: ParsableArguments {
        @Flag(name: .shortAndLong, help: "Inverts the conversion.")
        var invert = false

        @Argument var strings: [String] = []

        var string: String {
            return strings.joined(separator: " ")
        }

        mutating func validate() throws {
            guard !strings.isEmpty else {
                throw ValidationError("No string(s) provided.")
            }
        }
    }
}

Stringy.main()
