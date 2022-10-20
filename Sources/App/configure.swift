import Vapor
import Fluent
import FluentMySQLDriver
// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME") ??  "root",
        password: Environment.get("DATABASE_PASSWORD") ?? "12345678",
        database: Environment.get("DATABASE_NAME") ?? "toban_database",
        tlsConfiguration: .none), as: .mysql)
    
    app.middleware.use(
        FileMiddleware(publicDirectory: app.directory.publicDirectory)
    )
    
    app.migrations.add(CreateAcronym())
    app.migrations.add(CreateUser())
    app.logger.logLevel = .debug
    
    try app.autoMigrate().wait()
    app.views.use(.leaf)
    // register routes
    try routes(app)
}
