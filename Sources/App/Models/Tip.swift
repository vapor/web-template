import FluentSQLite
import Vapor

/// A tip for using Vapor.
final class Tip: SQLiteModel {
    /// The unique identifier for this `Tip`.
    var id: Int?

    /// The title of the `Tip`.
    var title: String
    
    /// The description of what this `Tip` entails.
    var text: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
}

/// Allows `Tip` to be used as a dynamic migration.
extension Tip: Migration { }

/// Allows `Tip` to be encoded to and decoded from HTTP messages.
extension Tip: Content { }

/// Allows `Tip` to be used as a dynamic parameter in route definitions.
extension Tip: Parameter { }
