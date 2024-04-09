import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // create movies
    app.post("movies") { req async throws in
       let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    // get all movies
    
    app.get("movies"){ req async throws in
       try await Movie.query(on: req.db)
            .all()
    }
    
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
    // /hotels?sort=desc&search=houston
    
//    app.get("hotels") { req async throws in
//        let hotelQuery = try req.query.decode(HotelQuery.self)
//        return hotelQuery
//    }
//    
//    /*
//     {
//     "title": "Batman",
//     "year": 2023
//     }
//     */
//    
//    app.get("movies") { req async throws in
//       let movie = try req.content.decode(Movie.self)
//        return movie
//    }
//    
//    app.get("customers", ":customersId") { req async throws -> String in
//        guard let customerId = req.parameters.get("customersId") else {
//            throw Abort(.badRequest)
//        }
//        return "\(customerId)"
//    }
//    
//    app.get("movies"){ req async in
//        [Movie(title: "Batman", year: 2012), Movie(title: "supermen", year: 2014), Movie(title: "SpiderMan", year: 1024)]
//    }
//    
//    app.get("movies",":genre") { req async throws -> String in
//        guard let genre = req.parameters.get("genre") else {
//            throw Abort(.badRequest)
//        }
//        return "All movies og genre: \(genre)"
//    }
//    
//    app.get("movies", ":genre", ":year") { req async throws -> String in
//        guard let genre = req.parameters.get("genre"),
//        let year = req.parameters.get("year")
//        else {
//            throw Abort(.badRequest)
//        }
//        
//        return "All movies og genre: \(genre) for \(year)"
//    }

    try app.register(collection: TodoController())
}
