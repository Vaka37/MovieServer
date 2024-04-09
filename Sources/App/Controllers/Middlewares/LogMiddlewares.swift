//
//  File.swift
//  
//
//  Created by Vakil on 09.04.2024.
//

import Foundation
import Vapor

struct LogMiddlewares: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: any Vapor.AsyncResponder) async throws -> Vapor.Response {
        print("Log Middlewares")
        return try await next.respond(to: request)
    }
    
    
}
