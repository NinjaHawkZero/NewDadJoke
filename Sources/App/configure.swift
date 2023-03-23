import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    if let urlString = Environment.get("DATABASE_URL"),
           var postgresConfig = PostgresConfiguration(url: urlString) {
            var tlsConfiguration = TLSConfiguration.makeClientConfiguration()
            tlsConfiguration.certificateVerification = .none
            postgresConfig.tlsConfiguration = tlsConfiguration
            app.databases.use(.postgres(configuration: postgresConfig), as: .psql)
        } else {
            app.databases.use(.postgres(
                hostname: Environment.get("DATABASE_HOST") ?? "localhost",
                port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
                username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
                password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
                database: Environment.get("DATABASE_NAME") ?? "vapor_database"
            ), as: .psql)
        }
    
    
    

   

  
    
//    if !app.environment.isRelease {
//        LeafRenderer.Option.caching = .bypass
//    }
    
    app.migrations.add(CreateTodo())

    app.views.use(.leaf)

    

    // register routes
    try routes(app)
}
