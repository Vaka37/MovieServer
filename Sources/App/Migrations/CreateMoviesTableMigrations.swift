//
//  File.swift
//  
//
//  Created by Vakil on 09.04.2024.
//

import Foundation
import Fluent

struct CreateMoviesTableMigrations: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        // create movies table
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("movies")
            .delete()
    }
}
