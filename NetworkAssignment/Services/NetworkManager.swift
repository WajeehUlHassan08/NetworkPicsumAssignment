//
//  NetworkManager.swift
//  NetworkAssignment
//
//  Created by Wajeeh Ul Hassan on 12/07/2022.
//


import Foundation


final class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    private let session: URLSession
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    
    func getData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
           
            
            completion(.success(data))
        

        }.resume()
        
        
        
    }
    
    func getResponse(url: URL?, completion: @escaping (Result<URLResponse, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            

            guard let response = response as? HTTPURLResponse else{
                completion(.failure(NetworkError.badData))
                return
            }
//            let newResponse = response.value(forHTTPHeaderField: "picsum-id")
//            print(newResponse)
            
            completion(.success(response))
        

        }.resume()
        
        
    }
    
}
