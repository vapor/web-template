import XCTest
import Testing
import HTTP
import Sockets
@testable import Vapor
@testable import App

/// This file shows an example of testing an
/// individual controller without initializing
/// a Droplet.

class PostControllerTests: TestCase {
    /// For these tests, we won't be spinning up a live
    /// server, and instead we'll be passing our constructed
    /// requests programmatically
    /// this is usually an effective way to test your
    /// application in a convenient and safe manner
    /// See RouteTests for an example of a live server test
    let controller = HelloController(TestViewRenderer())

    func testIndex() throws {
        let req = Request.makeTest(method: .get)
        try controller.index(req).makeResponse()
            .assertBody(contains: "hello") // path
            .assertBody(contains: "World") // default name
    }

    func testShow() throws {
        let req = Request.makeTest(method: .get)
        try controller.show(req, "Foo").makeResponse()
            .assertBody(contains: "hello") // path
            .assertBody(contains: "Foo") // custom name
    }
}

// MARK: Manifest

extension PostControllerTests {
    /// This is a requirement for XCTest on Linux
    /// to function properly.
    /// See ./Tests/LinuxMain.swift for examples
    static let allTests = [
        ("testIndex", testIndex),
        ("testShow", testShow),
    ]
}
