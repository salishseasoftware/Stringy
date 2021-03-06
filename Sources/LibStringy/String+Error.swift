import Foundation

extension String: Error, LocalizedError {
    public var errorDescription: String? { return self }
}
