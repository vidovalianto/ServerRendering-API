//
//  File.swift
//  
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Foundation
import Vapor

struct PhotoModel: Content {
  let name: String
  let photo: String
}

extension PhotoModel {
  static func loadModel(_ app: Application) -> [PhotoModel] {
    let directory = app.directory.workingDirectory
    let dataDir = "Sources/App/Data"
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: directory)
              .appendingPathComponent(dataDir, isDirectory: true)
              .appendingPathComponent("data.json", isDirectory: false))
      let decoder = JSONDecoder()
      let jsonData = try decoder.decode([PhotoModel].self, from: data)
      return jsonData
    } catch {
      print(error)
    }
    
    return []
  }
}
