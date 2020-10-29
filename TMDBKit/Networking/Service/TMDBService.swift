//
//  TMDBService.swift
//  TMDBKit
//
//  Created by Davi Cabral de Oliveira on 28/10/20.
//

import Foundation

struct TMDBService {
    typealias TMDBObject = Decodable & TMDBResponse
    
    func fetchData<Response: TMDBObject>(fromURL url: URL, ofType type: Response.Type, completion: @escaping (Result<Response, Error>) -> Void) {
        let urlSession = URLSession.shared
        let request = URLRequest(url: url)
        let task = urlSession.dataTask(with: request) { (responseData, response, error) in
            
            guard let data = responseData else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
