import Vapor
import Leaf

/// The endpoints for displaying `Tip`s.
final class TipController {
    /// Returns a page showing a list of all `Tip`s.
    func index(_ req: Request) throws -> Future<View> {
        return Tip.query(on: req).all().flatMap { tips in
            let leaf = try req.make(LeafRenderer.self)
            let context = TipsPage(tips: tips)
            return leaf.render("tips/index", context)
        }
    }

    /// Returns a page showing a single `Tip`.
    func detail(_ req: Request) throws -> Future<View> {
        return try req.parameters.next(Tip.self).flatMap { tip in
            let leaf = try req.make(LeafRenderer.self)
            let context = TipDetailPage(tip: tip)
            return leaf.render("tips/detail", context)
        }
    }
}

fileprivate struct TipsPage: Codable {
    let title = "Tips"
    let tips: [Tip]
}


fileprivate struct TipDetailPage: Codable {
    let title = "Tip Detail"
    let tip: Tip
}