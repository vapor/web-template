import FluentSQLite

/// Populate the database with records
func seed(connection: DatabaseConnection) -> Future<Void> {

    // Create `Tip`s
    let tip1 = Tip(title: "Where to start? ☔️", text: "The interesting files are in <code>Sources/App</code>, particularly <code>routes.swift</code> and <code>TipController.swift</code>.")
    let tip2 = Tip(title: "Routes returning web pages", text: """
        A Vapor website consists of a set of routes that return <code>Future&lt;View&gt;</code>.
        <br>Example:<pre style="font-size: 60%">router.get("/hey") { req -> Future&lt;View&gt; in
          let leaf = try req.make(LeafRenderer.self)
          return leaf.render("hey", [String: String]())
        }</pre>
        """)
    let tip3 = Tip(title: "What's leaf? 🍃", text: "It's where you write your HTML. Take a look at the files in <code>Resources/Views</code>.")
    let tip4 = Tip(title: "Layout views", text: "Create layout or template views by writing regular HTML in your leaf file but then put a <code>#get(body)</code> wherever you want to insert content.")
    let tip5 = Tip(title: "Content views", text: "If you have a layout view called <code>base.leaf</code> then your content view needs to have the line <code>#embed(\"base\")</code> and then write your content inside <code>#set(body) { ... }</code>. ")
    let tip6 = Tip(title: "Serve static files from Public", text: "Before you can serve static files (e.g. css, js, images), you must register the FileMiddleware in your configure.swift. It's already registered in this template! 🙂")
    let tip7 = Tip(title: "Raw content", text: "When you are using leaf to print the value of variables, the default tag <code>#(myVar)</code> performs HTML escaping. If your variable contains HTML then you want to print the variable 'raw' 🥩, so use the <code>#get(myVar)</code> tag instead.")
    
    // Save to the database
    let transactions = [ tip1, tip2, tip3, tip4, tip5, tip6, tip7 ].map { tip in tip.save(on: connection) }
    return transactions.flatten(on: connection).transform(to: ())
}
