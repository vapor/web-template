import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    // http://localhost:8080
    router.get { req -> Future<View> in
        let leaf = try req.make(LeafRenderer.self)
        let context = ["name": "World"]
        return leaf.render("hello", context)
    }

    // Example of configuring a controller
    let leafController = LeafController()
    // http://localhost:8080/hello
    router.get("hello", use: leafController.index)
    // http://localhost:8080/welcome
    router.get("welcome", use: leafController.welcome)
}

