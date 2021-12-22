//
//  Alamofire.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 20/12/2021.
//

import Foundation
final class Album {
  var type = ""
  var tags = ""
  init(data: [String: Any]) {
    if let type = data["type"] as? String {
      self.type = type
    }

    if let tags = data["tags"] as? String {
      self.tags = tags
    }
  }
}
