//
//  PostAPI.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 20/12/2021.
//

import Foundation
struct Post: Codable {
  let total: Int
  let totalHits: Int
  var hits: [Hits]
}
