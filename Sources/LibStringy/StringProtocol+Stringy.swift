import Foundation

public extension StringProtocol {
    /// Returns a new string with the first character lowercased.
    func firstLowercased() -> String {
        prefix(1).lowercased() + dropFirst()
    }

    /// Returns a new string with the first character uppercased.
    func firstUppercased() -> String {
        prefix(1).uppercased() + dropFirst()
    }

    /// Returns a new string with the first character capitalized.
    func firstCapitalized() -> String {
        prefix(1).capitalized + dropFirst()
    }

    /// Transforms a string into a camelCased string.
    ///
    /// E.G. "Camel Case String" -> "camelCaseString".
    func camelcased() -> String {
        components(separatedBy: .whitespaces)
            .map({ $0.capitalized })
            .joined()
            .firstLowercased()
    }

    /// Transforms a camelCaseString into one with a single space between the words.
    ///
    /// E.G. "camelCaseString" -> "camel case string".
    func uncamelcased() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                if !$0.isEmpty {
                    return ($0 + " " + String($1))
                }
            }
            return $0 + String($1)
        }
        .lowercased()
    }

    /// Returns a string that replaces occurrences of white space characters with an underscore.
    ///
    /// E.G. "Snakes are slithery" -> "snakes_are_slithery".
    func snakecased() -> String {
        components(separatedBy: .whitespaces)
            .joined(separator: "_")
            .lowercased()
    }

    /// Returns a string that replaces occurrences of underscore characters with a space.
    ///
    /// E.G. "snakes_are_slithery" -> "snakes are slithery".
    func unsnakecased() -> String {
        split(separator: "_")
            .joined(separator: " ")
    }

    /// Returns a string that replaces occurrences of white space characters with a hyphen.
    ///
    /// E.G. "Words on a stick" -> "words-on-a-stick".
    func kebabcased() -> String {
        components(separatedBy: .whitespaces)
            .joined(separator: "-")
            .lowercased()
    }

    /// Returns a string that replaces occurrences of "-" characters with a space.
    ///
    /// E.G. "words-on-a-stick" -> "words on a stick".
    func unkebabcased() -> String {
        split(separator: "-")
            .joined(separator: " ")
    }
}
