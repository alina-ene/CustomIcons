//
//  NetworkService.swift
//  CustomIcons
//
//  Created by Alina Ene on 14/05/2021.
//

import Foundation

final class NetworkService {
    
    func loadJson<T: Codable>(fromURLString urlString: String,
                              completion: @escaping (Result<T, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let dat = data, let obj: T = self.parse(jsonData: dat) {
                    completion(.success(obj))
                }  else {
                    completion(.failure(NSError(domain:"", code:401, userInfo:nil)))
                }
                
            }
            
            urlSession.resume()
        }
    }
    
    func parse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self,
                                                       from: jsonData)
            print("Description: ", decodedData)
            return decodedData
        } catch {
            print("decode error")
            return nil
        }
    }
}
