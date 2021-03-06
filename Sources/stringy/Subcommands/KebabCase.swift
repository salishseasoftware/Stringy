import Foundation
import ArgumentParser
import LibStringy

struct KebabCase: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "kebabcase",
        abstract: "Converts strings to kebab-case.",
        discussion: "E.G. 'Words on a stick' -> 'words-on-a-stick'"
    )

    @OptionGroup var options: Stringy.Options

    mutating func run() {
        print(options.invert ? options.string.unkebabcased() : options.string.kebabcased())
    }
}
