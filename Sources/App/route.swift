//
//  File.swift
//  
//
//  Created by Vakil on 09.04.2024.
//

import Foundation
import Vapor

func route(_ app: Application) throws {
    app.middleware.use(LogMiddlewares())
    
    app.grouped(AuthMeddlewares()).group("members") { route in
        route.get{ req async -> String in
        return "Member index"
        }
        
        route.get("hello"){ req async -> String in
        return "Member hello"
        }
    }
    
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
}
