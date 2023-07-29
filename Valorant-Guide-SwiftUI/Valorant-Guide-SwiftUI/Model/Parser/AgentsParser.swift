//
//  AgentsParser.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//


import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct AgentsParser: Codable {
    var status: Int
    var data: [AgentsDatum]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - AgentsDatum
struct AgentsDatum: Codable {
    var uuid: String
    var displayName: String
    var description: String
    var developerName: String
    var characterTags: [String]?
    var displayIcon: String
    var displayIconSmall: String
    var bustPortrait: String?
    var fullPortrait: String?
    var fullPortraitV2: String?
    var killfeedPortrait: String
    var background: String?
    var backgroundGradientColors: [String]
    var assetPath: String
    var isFullPortraitRightFacing: Bool
    var isPlayableCharacter: Bool
    var isAvailableForTest: Bool
    var isBaseContent: Bool
    var role: Role?
    var abilities: [Ability]
    var voiceLine: VoiceLine

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case description = "description"
        case developerName = "developerName"
        case characterTags = "characterTags"
        case displayIcon = "displayIcon"
        case displayIconSmall = "displayIconSmall"
        case bustPortrait = "bustPortrait"
        case fullPortrait = "fullPortrait"
        case fullPortraitV2 = "fullPortraitV2"
        case killfeedPortrait = "killfeedPortrait"
        case background = "background"
        case backgroundGradientColors = "backgroundGradientColors"
        case assetPath = "assetPath"
        case isFullPortraitRightFacing = "isFullPortraitRightFacing"
        case isPlayableCharacter = "isPlayableCharacter"
        case isAvailableForTest = "isAvailableForTest"
        case isBaseContent = "isBaseContent"
        case role = "role"
        case abilities = "abilities"
        case voiceLine = "voiceLine"
    }
}

// MARK: - Ability
struct Ability: Codable {
    var slot: Slot?
    var displayName: String
    var description: String
    var displayIcon: String?

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case displayName = "displayName"
        case description = "description"
        case displayIcon = "displayIcon"
    }
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - Role
struct Role: Codable {
    var uuid: String
    var displayName: DisplayName?
    var description: String
    var displayIcon: String
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case description = "description"
        case displayIcon = "displayIcon"
        case assetPath = "assetPath"
    }
}

enum DisplayName: String, Codable {
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

// MARK: - VoiceLine
struct VoiceLine: Codable {
    var minDuration: Double
    var maxDuration: Double
    var mediaList: [MediaList]

    enum CodingKeys: String, CodingKey {
        case minDuration = "minDuration"
        case maxDuration = "maxDuration"
        case mediaList = "mediaList"
    }
}

// MARK: - MediaList
struct MediaList: Codable {
    var id: Int
    var wwise: String
    var wave: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case wwise = "wwise"
        case wave = "wave"
    }
}
