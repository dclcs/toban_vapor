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
    }
    
    func indexHandler(_ req: Request) -> EventLoopFuture<View> {
        return req.view.render("index")
    }
}
