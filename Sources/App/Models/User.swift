//
//  User.swift
//  
//
//  Created by daicl on 2022/10/20.
//

import Vapor
import Fluent
final class User: Model, Content {
    static let schema: String = "users"
    
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "username")
    var username: String
    
    @Children(for: \.$user)
    var acronyms: [Acronym]
    
    required init() {
        
    }
    
    init(id: UUID? = nil, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}
