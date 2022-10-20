import Vapor
import Fluent
import FluentSQLiteDriver
// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.sqlite(.memory), as: .sqlite)
    
    app.migrations.add(CreateAcronym())
    app.migrations.add(CreateUser())
    app.logger.logLevel = .debug
    
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
