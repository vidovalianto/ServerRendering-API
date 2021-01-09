//
//  File.swift
//  
//
//  Created by Vido Shaweddy on 1/6/21.
//

import Vapor

struct HomeController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let homeRoute = routes.grouped("page")
    homeRoute.get("model", use: getModel)
    homeRoute.get("home", use: getHome)
    homeRoute.get(use: test)
  }
  
  func test(_ req: Request) -> String {
    return "Hello"
  }
  
  func getHome(_ req: Request) -> TemplateModel {
    let template = TemplateModel.loadModel(req.application)
    return template
  }
  
  func getModel(_ req: Request) -> [PhotoModel] {
    let photos = PhotoModel.loadModel(req.application)
    return photos
  }
  
}
