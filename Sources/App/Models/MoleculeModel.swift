//
//  File.swift
//  
//
//  Created by Vido Shaweddy on 1/7/21.
//

import Vapor

struct MoleculeModel: Content {
  let type : String
  let data: [String: String]
}
