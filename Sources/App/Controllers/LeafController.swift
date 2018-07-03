import Vapor
import Leaf

/// Leaf Controller
final class LeafController {
    /// Returns hello.leaf
    func index(_ req: Request) throws -> Future<View> {
        let leaf = try req.make(LeafRenderer.self)
        let context = ["name": "World"]
        return leaf.render("hello", context)
    }
    
    /// Returns welcome.leaf
    func welcome(_ req: Request) throws -> Future<View> {
        let leaf = try req.make(LeafRenderer.self)
        let context = [String: String]()
        return leaf.render("welcome", context)
    }
}

