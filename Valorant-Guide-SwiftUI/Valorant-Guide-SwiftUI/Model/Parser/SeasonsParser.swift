//
//  SeasonsParser.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct SeasonsParser: Codable {
    var status: Int
    var data: [SeasonsDatum]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - SeasonsDatum
struct SeasonsDatum: Codable {
    var uuid: String
    var displayName: String
    var type: TypeEnum?
    var startTime: Date
    var endTime: Date
    var parentUUID: String?
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case type = "type"
        case startTime = "startTime"
        case endTime = "endTime"
        case parentUUID = "parentUuid"
        case assetPath = "assetPath"
    }
}

enum TypeEnum: String, Codable {
    case eAresSeasonTypeAct = "EAresSeasonType::Act"
}

