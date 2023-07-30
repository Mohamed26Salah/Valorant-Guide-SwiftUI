//
//  AgentViewModel.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import Foundation
class AgentViewModel: ObservableObject {
    private let provider = NetworkAPIProvider()
    private let baseURL = URL(string: "https://valorant-api.com/v1/")
    private let apiHandler: APIClient
//    private let parser = ResourceParser<AgentsParser>()
    @Published var agentsData: AgentsParser?
    init() {
        guard let apiURL = baseURL else {
            fatalError("Failed to create baseURL")
        }
        apiHandler = APIClient(baseURL: apiURL, apiProvider: provider)
        apiHandler.fetchResourceData(modelDTO: agentsData, resource: URLHeads.agents.rawValue, completion: { result in
            switch result {
            case .success(let data):
//                print(data)
                DispatchQueue.main.async {
                    self.agentsData = data
                }
            case .failure(let error):
                print(error)
            }
        })
    }
 
}
