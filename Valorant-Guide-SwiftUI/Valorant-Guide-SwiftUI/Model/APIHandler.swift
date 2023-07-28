//
//  APIHandler.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 28/07/2023.
//


//Questions For Eng. ahmed El naggar
//1- is this the right way ?
//2- why T==P
//3- Why I need to write -> Void with @@escaping
import Foundation

protocol APIProvider {
    func fetchData(for resource: String, completion: @escaping (Result<Data, Error>) -> Void)
}

protocol ResponseParser {
    associatedtype ParsedType: Decodable
    func parse(_ data: Data) throws -> ParsedType
}


class NetworkAPIProvider: APIProvider {
    func fetchData(for resource: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Perform network request using URLSession or any networking library of your choice
        // Call the completion handler with the received data or an error if something goes wrong
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
struct ResourceModel: Decodable {
    // Your model properties and methods
}

class ResourceParser<T: Decodable>: ResponseParser {
    typealias ParsedType = T

    func parse(_ data: Data) throws -> T {
        // Implement the parsing logic specific to the parsing model (T)
        // Decode the data into the specified type (T) or throw an error if parsing fails
        return T.self as! T
    }
}
