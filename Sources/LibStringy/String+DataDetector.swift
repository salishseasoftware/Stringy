import Foundation

public extension String {

    // MARK: - Web URL

    /// Extract all web urls from a string.
    func webURLs() -> [String] {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return []
        }
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        return matches.compactMap {
            guard let url = $0.url,
                  let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                  components.url != nil,
                  ["http", "https"].contains(components.scheme)
            else {
                return nil
            }
            return url.absoluteString.isEmpty ? nil : url.absoluteString
        }
    }

    /// True if a string is a valid web URL, according to apple's data detectors anyway.
    var isWebUrl: Bool {
        let urls = self.webURLs()
        guard urls.count == 1, let found = urls.first else { return false }
        return found == self
    }

    // MARK: - Email address

    /// Extract all email addresses from a string.
    func emailAddresses() -> [String] {
        guard  let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return []
        }
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))

        return matches.compactMap {
            guard let url = $0.url,
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                components.scheme == "mailto"
            else {
                return nil
            }
            return components.path
        }
    }

    /// True if a string is a valid email address, according to apple's data detectors anyway.
    ///
    /// Friends don't let friends use regex to validate email addresses
    ///
    /// * https://stackoverflow.com/questions/48055431/can-it-cause-harm-to-validate-email-addresses-with-a-regex
    /// * https://stackoverflow.com/questions/201323/how-to-validate-an-email-address-using-a-regular-expression
    ///
    var isEmailAddress: Bool {
        let emails = self.emailAddresses()
        guard emails.count == 1, let found = emails.first else { return false }
        return found == self
    }

    // MARK: - Phone number

    /// True if a string is a valid phone number, according to apple's data detectors anyway.
    var isPhoneNumber: Bool {
        let phoneNumbers = self.phoneNumbers()
        guard phoneNumbers.count == 1, let found = phoneNumbers.first else { return false }
        return found == self
    }

    /// Extract all phone numbers from a string.
    func phoneNumbers() -> [String] {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue) else {
            return []
        }
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        return matches.compactMap { $0.phoneNumber }
    }
}
