//
//  WebsiteController.swift
//  
//
//  Created by daicl on 2022/10/20.
//

import Vapor

class WebsiteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: indexHandler)
        routes.get("acronyms", ":acronymID", use: acronymHander)
    }
    
    func indexHandler(_ req: Request) -> EventLoopFuture<View> {
        Acronym.query(on: req.db).all().flatMap { acronyms in
            let acronymsData = acronyms.isEmpty ? nil : acronyms
            let context = IndexContext(title: "HomePage", acronyms: acronymsData)
            return req.view.render("index", context)
        }
    }
    
    func acronymHander(_ req: Request) -> EventLoopFuture<View> {
        Acronym.find(req.parameters.get("acronymID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { acronym in
                acronym.$user.get(on: req.db).flatMap { user in
                    let context = AcronymContext(title: acronym.short, acronym: acronym, user: user)
                    return req.view.render("acronym", context)
                }
            }
    }
}

struct IndexContext: Encodable {
    let title: String
    let acronyms: [Acronym]?
}


struct AcronymContext: Encodable {
    let title: String
    let acronym: Acronym
    let user: User
}
