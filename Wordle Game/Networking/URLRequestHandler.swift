//
//  URLRequestHandler.swift
//  Wordle Game
//
//  Created by mohamedSliem on 12/1/22.
//

import Foundation


final class URLRequestHandler{
   
    var hostURL: URL?
    var absoluteURL: URL?
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    var httpMethod: HTTPMethod?
    var queryParameters: URLComponents?
    
    static let shared = URLRequestHandler()
    
    private init(){}
    
    func handleRequest <T: Codable> (with endpoint: Endpoint, objectType: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        
        setRequestEndpoint(endpoint: endpoint)
        setRequestParameters(parameters:  endpoint.parameters)
        let request = initailizeRequest()

        startRequestTask(type: objectType, request: request) { (result) in
            switch result{
            
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func setRequestEndpoint(endpoint: Endpoint){
        hostURL = URL(string: endpoint.baseURL)
        absoluteURL = URL(string: endpoint.pathURL, relativeTo: hostURL)
        headers = endpoint.headers
        httpMethod = endpoint.httpMethod
    }
    
    
    private func setRequestParameters(parameters: [String:Any]){
       
        var queries = [URLQueryItem]()
        
        for parameter in parameters {
            queries.append(URLQueryItem(name: parameter.key, value: String(describing: parameter.value)))
        }
        
        var urlComponents = URLComponents(url: absoluteURL!, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queries
        absoluteURL = urlComponents?.url
    }
    
    private func initailizeRequest() -> URLRequest{
        var request = URLRequest(url: absoluteURL!)
        request.httpMethod = httpMethod?.rawValue
        request.timeoutInterval = 30
        request.allHTTPHeaderFields = headers
        return request
    }
    
    private func startRequestTask<T : Codable> (
        type : T.Type ,
        request: URLRequest ,
        taskCompletion : @escaping(Result<T , Error>) -> Void){
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in

            guard let data = data, error == nil else {
                taskCompletion(.failure(error!))
                return
            }
             
            let result = String(data: data, encoding: .utf8) as! T
            print(result)
            taskCompletion(.success(result))
        }
        task.resume()
        
    }
    

    
}

