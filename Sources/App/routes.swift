import Vapor

func routes(_ r: Routes, _ c: Container) throws {
    let view = try c.make(ViewRenderer.self)

    r.get { req -> EventLoopFuture<View> in
        return view.render("welcome")
    }

    r.get("hello", ":name") { req -> EventLoopFuture<View> in
        return view.render("hello", [
            "name": req.parameters.get("name") ?? "n/a"
        ])
    }
}
