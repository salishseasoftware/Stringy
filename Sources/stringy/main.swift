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



extension Stringy {
    /*
    struct CamelCase: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "camelcase",
            abstract: "Converts strings to camelCase",
            discussion: "E.G. Earth Sun Moon -> earthSunMoon"
        )

        @OptionGroup var options: Options

        mutating func run() {
            print(options.invert ? options.string.uncamelcased() : options.string.camelcased())
        }
    }
    */

    /*
    struct SnakeCase: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "snakecase",
            abstract: "Converts strings to snake_case.",
            discussion: "E.G. 'Snakes are slithery' -> 'snakes_are_slithery'"
        )

        @OptionGroup var options: Options

        mutating func run() {
            print(options.invert ? options.string.unsnakecased() : options.string.snakecased())
        }
    }
    */

    /*
    struct KebabCase: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "kebabcase",
            abstract: "Converts strings to kebab-case.",
            discussion: "E.G. 'Words on a stick' -> 'words-on-a-stick'"
        )

        @OptionGroup var options: Options

        mutating func run() {
            print(options.invert ? options.string.unkebabcased() : options.string.kebabcased())
        }
    }
    */

    private static func collapseString(from options: Options) -> String {
        return options.strings.joined(separator: " ")
    }
}

Stringy.main()
