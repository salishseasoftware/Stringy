import Foundation
import ArgumentParser
import LibStringy

struct SnakeCase: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "snakecase",
        abstract: "Converts strings to snake_case.",
        discussion: "E.G. 'Snakes are slithery' -> 'snakes_are_slithery'"
    )

    @OptionGroup var options: Stringy.Options

    mutating func run() {
        print(options.invert ? options.string.unsnakecased() : options.string.snakecased())
    }
}
