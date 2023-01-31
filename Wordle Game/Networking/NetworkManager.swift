//
//  APiCalller.swift
//  Wordly Game
//
//  Created by mohamedSliem on 3/8/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init (){}
    
    
    public func startRequest <T: Codable> (with endpoint: Endpoint, objectType: T.Type, completion: @escaping(Result<T, Error>) -> Void){
        URLRequestHandler.shared.handleRequest(with: endpoint, objectType: objectType.self) { (result) in

            switch result {
            
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
        

}
