import Foundation

public extension String {
    /// Adds prefix to self
    mutating func addPrefix(_ prefix: String) {
        self = prefix + self
    }

    /// Returns a new string, with the prefix added
    func addingPrefix(_ prefix: String) -> String {
        return prefix + self
    }

    /// Adds a given prefix to self, if the prefix does exist in self.
     mutating func addPrefixIfNeeded(_ prefix: String) {
         guard !self.hasPrefix(prefix) else { return }
         self = prefix + self
     }

    /// Returns a new string, with the prefix added if does not already exist.
    func addingPrefixIfNeeded(_ prefix: String) -> String {
        guard !self.hasPrefix(prefix) else { return self }
        return prefix + self
    }
}

public extension Optional where Wrapped == String {
    /// returns nil for an empty string
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}
