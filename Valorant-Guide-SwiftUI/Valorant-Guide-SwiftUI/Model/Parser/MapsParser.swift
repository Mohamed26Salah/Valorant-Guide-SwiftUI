//
//  MapsParser.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct MapsParser: Codable {
    var status: Int
    var data: [MapsDatum]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - MapsDatum
struct MapsDatum: Codable {
    var uuid: String
    var displayName: String
    var coordinates: String?
    var displayIcon: String?
    var listViewIcon: String
    var splash: String
    var assetPath: String
    var mapURL: String
    var xMultiplier: Double
    var yMultiplier: Double
    var xScalarToAdd: Double
    var yScalarToAdd: Double
    var callouts: [Callout]?

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case coordinates = "coordinates"
        case displayIcon = "displayIcon"
        case listViewIcon = "listViewIcon"
        case splash = "splash"
        case assetPath = "assetPath"
        case mapURL = "mapUrl"
        case xMultiplier = "xMultiplier"
        case yMultiplier = "yMultiplier"
        case xScalarToAdd = "xScalarToAdd"
        case yScalarToAdd = "yScalarToAdd"
        case callouts = "callouts"
    }
}

// MARK: - Callout
struct Callout: Codable {
    var regionName: String
    var superRegionName: SuperRegionName?
    var location: Location

    enum CodingKeys: String, CodingKey {
        case regionName = "regionName"
        case superRegionName = "superRegionName"
        case location = "location"
    }
}

// MARK: - Location
struct Location: Codable {
    var x: Double
    var y: Double

    enum CodingKeys: String, CodingKey {
        case x = "x"
        case y = "y"
    }
}

enum SuperRegionName: String, Codable {
    case a = "A"
    case attackerSide = "Attacker Side"
    case b = "B"
    case c = "C"
    case defenderSide = "Defender Side"
    case mid = "Mid"
}

