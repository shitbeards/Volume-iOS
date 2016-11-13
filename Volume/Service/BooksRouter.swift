//
//  BooksRouter.swift
//  Volume-iOS
//
//  Created by Vlad Radu on 12/11/2016.
//  Copyright © 2016 Vlad Radu. All rights reserved.
//

import Foundation
import Alamofire

enum BooksRouter: URLRequestConvertible {
  static let baseURLPath = ProcessInfo().environment["API_BASE_URL"]!
  static let apiVersionNumber = 1
  
  case book(query: String)
  
  func asURLRequest() throws -> URLRequest {
    let result: (path: String, parameters: Parameters) = {
      switch self {
      case let .book(query):
        return ("/books", ["query" : query])
      }
    }()
    
    let url = try BooksRouter.baseURLPath.asURL()
    let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
    
    return try URLEncoding.default.encode(urlRequest, with: result.parameters)
  }
}
