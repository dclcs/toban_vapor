//
//  Acronym.swift
//  
//
//  Created by cl d on 2022/10/19.
//

import Vapor
import Fluent

final class Acronym: Model {
    static let schema = "acronyms" // name of the table in the database
    
    @ID
    var id : UUID?
    
    @Field(key: "short")
    var short: String
    
    @Field(key: "long")
    var long: String
    
    @Parent(key: "userID")
    var user: User
    
    init(id: UUID? = nil, short: String, long: String, userID: User.IDValue) {
        self.id = id
        self.short = short
        self.long = long
        self.$user.id = userID
    }
    
    required init() { }
    
}


extension Acronym: Content {
    
}
