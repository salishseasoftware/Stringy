import Foundation
import ArgumentParser
import LibStringy

struct CamelCase: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "camelcase",
        abstract: "Converts strings to camelCase",
        discussion: "E.G. Earth Sun Moon -> earthSunMoon"
    )

    @OptionGroup var options: Stringy.Options

    mutating func run() {
        print(options.invert ? options.string.uncamelcased() : options.string.camelcased())
    }
}
