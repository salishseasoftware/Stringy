import Foundation

public extension StringProtocol {
    /// Sparate a string by word boundaries.
    ///
    /// - Returns: An array of strings, representing a list of words.
    func words() -> [String] {
        return self.substrings(options: .byWords)
    }

    /// Sparate a string by sentences.
    ///
    /// - Returns: An array of strings, representing a list of sentences.
    func sentences() -> [String] {
        return self.substrings(options: .bySentences)
    }

    /// Sparate a string by paragraphs.
    ///
    /// - Returns: An array of strings, representing a list of paragraphs.
    func paragraphs() -> [String] {
        return self.substrings(options: .byParagraphs)
    }

    /// Sparate a string by lines.
    ///
    /// - Returns: An array of strings, representing a list of lines.
    func lines() -> [String] {
        return self.substrings(options: .byLines)
    }

    /// Sparate a string eumeration options.
    ///
    /// - Parameter options: Options specifying types of substrings and enumeration styles.
    ///     If opts is omitted or empty, body is called a single time with the range of
    ///     the string specified by range.
    /// - Returns: Array of strings, separated by the specified options.
    func substrings(options: NSString.EnumerationOptions) -> [String] {
        let range: Range<String.Index> = self.startIndex ..< self.endIndex
        var substrings = [String]()
        self.enumerateSubstrings(in: range, options: options) {substr,_,_,_ in
            guard let substring = substr, !substring.isEmpty else { return }
            substrings.append(substring)
        }
        return substrings
    }

    var isCapitalized: Bool {
        return self.first?.isUppercase ?? false
    }
}
