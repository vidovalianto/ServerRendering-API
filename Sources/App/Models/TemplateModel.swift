//
//  File.swift
//  
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Vapor

struct TemplateModel: Content {
  let title: String
  let molecules: [MoleculeModel]
}

extension TemplateModel {
  static func loadModel(_ app: Application) -> TemplateModel {
    let directory = app.directory.workingDirectory
    let dataDir = "Sources/App/Data"
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: directory)
              .appendingPathComponent(dataDir, isDirectory: true)
              .appendingPathComponent("home.json", isDirectory: false))
      let decoder = JSONDecoder()
      let jsonData = try decoder.decode(TemplateModel.self, from: data)
      return jsonData
    } catch {
      print(error)
    }
    
    return TemplateModel(title: "", molecules: [])
  }
}
