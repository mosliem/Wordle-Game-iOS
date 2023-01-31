//
//  BoardRequest.swift
//  Wordle Game
//
//  Created by mohamedSliem on 1/31/23.
//

import Foundation

enum BoardRequest: Endpoint {
    case fetchRandomWord
    
    var baseURL: String {
        return "https://random-words5.p.rapidapi.com"
    }
    
    var pathURL: String{
        return "getRandom"
    }
    
    var headers: [String : String] {
        return [
            "X-RapidAPI-Key": "497aa590e0msh79691bda3ce92b8p14e6a1jsn5d37c4680c6a",
            "X-RapidAPI-Host": "random-words5.p.rapidapi.com"
        ]
    }
    
    var httpMethod: HTTPMethod{
        return .GET
    }
    
    var parameters: [String : Any]{
        return ["wordLength" : 5]
    }
    
    
}
