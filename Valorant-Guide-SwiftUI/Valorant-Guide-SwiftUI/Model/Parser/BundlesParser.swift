//
//  BundlesParser.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct BundlesParser: Codable {
    var status: Int
    var data: [BundlesDatum]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - Datum
struct BundlesDatum: Codable {
    var uuid: String
    var displayName: String
    var displayNameSubText: String?
    var description: String
    var extraDescription: String?
    var promoDescription: String?
    var useAdditionalContext: Bool
    var displayIcon: String
    var displayIcon2: String
    var verticalPromoImage: String?
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case displayNameSubText = "displayNameSubText"
        case description = "description"
        case extraDescription = "extraDescription"
        case promoDescription = "promoDescription"
        case useAdditionalContext = "useAdditionalContext"
        case displayIcon = "displayIcon"
        case displayIcon2 = "displayIcon2"
        case verticalPromoImage = "verticalPromoImage"
        case assetPath = "assetPath"
    }
}
