import Vapor
import FluentSQLite

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    
    /// Seed the database (called on boot because it this example uses in-memory db)
    try app.withPooledConnection(to: .sqlite, closure: seed).wait()

}
