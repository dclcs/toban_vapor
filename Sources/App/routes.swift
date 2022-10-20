import Vapor
import Leaf
func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // 1
//    app.post("api", "acronyms") { req -> EventLoopFuture<Acronym> in
//      // 2
//      let acronym = try req.content.decode(Acronym.self)
//      // 3
//      return acronym.save(on: req.db).map { acronym }
//    }
//
//
//    app.get("api", "acronyms") { req -> EventLoopFuture<[Acronym]> in
//
//        Acronym.query(on: req.db).all()
//
//    }
//
//
//    app.get("api", "acronyms", ":acronymsID") { req -> EventLoopFuture<Acronym> in
//
//        Acronym.find(req.parameters.get("acronymsID"), on: req.db)
//            .unwrap(or: Abort(.notFound))
//
//    }
    
    
    let usersController = UsersController()
    let acroymController = AcronymsController()
    let websiteController = WebsiteController()
    try app.register(collection: usersController)
    try app.register(collection: acroymController)
    try app.register(collection: websiteController)
}
