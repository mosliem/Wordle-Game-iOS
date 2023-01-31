//
//  Endpoint.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/1/22.
//

import Foundation

public typealias Parameters = [String: Any]

protocol Endpoint {
    
    var baseURL: String {get}
    var pathURL: String {get}
    var headers: [String: String] {get}
    var httpMethod: HTTPMethod {get}
    var parameters: [String: Any] {get}

}
