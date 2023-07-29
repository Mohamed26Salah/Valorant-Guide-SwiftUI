//
//  APIHandler.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 28/07/2023.
//

//Questions For Eng. ahmed El naggar
//1- is this the right way ?
//2- why T==P
//3- Why I need to write -> Void with @escaping

import Foundation

enum URLHeads: String {
    case agents
    case bundles
    case maps
    case seasons
    case weapons
}

protocol APIProvider {
    func fetchData(for resource: String, completion: @escaping (Result<Data, Error>) -> Void)
}

protocol ResponseParser {
    associatedtype ParsedType: Decodable
    func parse(_ data: Data) throws -> ParsedType
}


class NetworkAPIProvider: APIProvider {
    func fetchData(for resource: String, completion: @escaping (Result<Data, Error>) -> Void) {
        print(resource)
        guard let apiURL = URL(string: resource) else {
            let customError = NSError(domain: "URL is Wrong", code: 0, userInfo: nil)
            completion(.failure(customError))
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
//                print("No data received")
                let customError = NSError(domain: "NoDataError", code: 0, userInfo: nil)
                completion(.failure(customError))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}

class ResourceParser<T: Decodable>: ResponseParser {
    typealias ParsedType = T
    
    func parse(_ data: Data) throws -> T {
        do {
            let decodedApi = try JSONDecoder().decode(T.self, from: data)
            return decodedApi
        } catch {
            throw error
        }
    }
}

class APIClient {
    private let baseURL: URL
    private let apiProvider: APIProvider
    
    init(baseURL: URL, apiProvider: APIProvider) {
        self.baseURL = baseURL
        self.apiProvider = apiProvider
    }
    
    func fetchResourceData<T: Decodable, P: ResponseParser>(resource: String, parser: P, completion: @escaping (Result<T, Error>) -> Void) where P.ParsedType == T {
        let resourceURL = baseURL.appendingPathComponent(resource)
        apiProvider.fetchData(for: resourceURL.absoluteString) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedData = try parser.parse(data)
                    completion(.success(parsedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

