import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Simple example of a route that renders a leaf page
    router.get("/") { req -> Future<View> in
        let leaf = try req.make(LeafRenderer.self)
        return leaf.render("index", [String: String]())
    }

    // Typically routes reference a controller method
    let tipController = TipController()
    router.get("tips", use: tipController.index)
    router.get("tips", Tip.parameter, use: tipController.detail)
}
