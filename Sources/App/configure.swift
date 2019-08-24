import Leaf
import Vapor

/// Called before your application initializes.
func configure(_ s: inout Services) throws {
    // Register providers first
    s.provider(LeafProvider())

    /// Register routes
    s.extend(Routes.self) { r, c in
        try routes(r, c)
    }

    /// Register middleware
    s.register(MiddlewareConfiguration.self) { c in
        // Create _empty_ middleware config
        var middlewares = MiddlewareConfiguration()

        // Serves files from `Public/` directory
        try middlewares.use(c.make(FileMiddleware.self))

        // Catches errors and converts to HTTP response
        try middlewares.use(c.make(ErrorMiddleware.self))

        return middlewares
    }
}
