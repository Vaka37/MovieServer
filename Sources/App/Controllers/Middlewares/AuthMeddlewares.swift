//
//  File.swift
//  
//
//  Created by Vakil on 09.04.2024.
//

import Foundation
import Vapor

struct AuthMeddlewares: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: any Vapor.AsyncResponder) async throws -> Vapor.Response {
        guard let auth = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        print(auth.token)
        return try await next.respond(to: request)
    }
    
    
}
