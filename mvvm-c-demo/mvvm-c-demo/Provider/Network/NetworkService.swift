//
//  NetworkService.swift
//  mvvm-c-demo
//
//  Created by Quang V. Luu on 12/9/19.
//  Copyright © 2019 Officience SARL. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case domainError
    case decodingError
}

protocol NetworkServiceProtocol {
    var session: URLSession { get }
    func fetchItem<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    var session: URLSession
    private var dataTask: URLSessionDataTask?
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    private func load<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        self.session.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
                }
                return
            }
            
            do {
                let items = try JSONDecoder().decode(T.self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func fetchItem<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        load(url: url, completion: completion)
    }
    
    func fetchItems<T: Decodable>(url: URL, completion: @escaping (Result<[T], NetworkError>) -> Void)  {
        load(url: url, completion: completion)
    }
}

