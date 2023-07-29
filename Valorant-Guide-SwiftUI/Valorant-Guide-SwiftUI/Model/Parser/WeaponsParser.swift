//
//  WeaponsParser.swift
//  Valorant-Guide-SwiftUI
//
//  Created by Mohamed Salah on 29/07/2023.
//

import Foundation
import OptionallyDecodable

// MARK: - DecodeScene
struct WeaponsParser: Codable {
    var status: Int
    var data: [WeaponsDatum]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

// MARK: - WeaponsDatum
struct WeaponsDatum: Codable {
    var uuid: String
    var displayName: String
    var category: String
    var defaultSkinUUID: String
    var displayIcon: String
    var killStreamIcon: String
    var assetPath: String
    var weaponStats: WeaponStats?
    var shopData: ShopData?
    var skins: [Skin]

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case category = "category"
        case defaultSkinUUID = "defaultSkinUuid"
        case displayIcon = "displayIcon"
        case killStreamIcon = "killStreamIcon"
        case assetPath = "assetPath"
        case weaponStats = "weaponStats"
        case shopData = "shopData"
        case skins = "skins"
    }
}

// MARK: - ShopData
struct ShopData: Codable {
    var cost: Int
    var category: String
    var categoryText: String
    var gridPosition: GridPosition?
    var canBeTrashed: Bool
    var image: JSONNull?
    var newImage: String
    var newImage2: JSONNull?
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case cost = "cost"
        case category = "category"
        case categoryText = "categoryText"
        case gridPosition = "gridPosition"
        case canBeTrashed = "canBeTrashed"
        case image = "image"
        case newImage = "newImage"
        case newImage2 = "newImage2"
        case assetPath = "assetPath"
    }
}

// MARK: - GridPosition
struct GridPosition: Codable {
    var row: Int
    var column: Int

    enum CodingKeys: String, CodingKey {
        case row = "row"
        case column = "column"
    }
}

// MARK: - Skin
struct Skin: Codable {
    var uuid: String
    var displayName: String
    var themeUUID: String
    var contentTierUUID: String?
    var displayIcon: String?
    var wallpaper: String?
    var assetPath: String
    var chromas: [Chroma]
    var levels: [Level]

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case themeUUID = "themeUuid"
        case contentTierUUID = "contentTierUuid"
        case displayIcon = "displayIcon"
        case wallpaper = "wallpaper"
        case assetPath = "assetPath"
        case chromas = "chromas"
        case levels = "levels"
    }
}

// MARK: - Chroma
struct Chroma: Codable {
    var uuid: String
    var displayName: String
    var displayIcon: String?
    var fullRender: String
    var swatch: String?
    var streamedVideo: String?
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case displayIcon = "displayIcon"
        case fullRender = "fullRender"
        case swatch = "swatch"
        case streamedVideo = "streamedVideo"
        case assetPath = "assetPath"
    }
}

// MARK: - Level
struct Level: Codable {
    var uuid: String
    var displayName: String
    var levelItem: LevelItem?
    var displayIcon: String?
    var streamedVideo: String?
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case levelItem = "levelItem"
        case displayIcon = "displayIcon"
        case streamedVideo = "streamedVideo"
        case assetPath = "assetPath"
    }
}

enum LevelItem: String, Codable {
    case eEquippableSkinLevelItemAnimation = "EEquippableSkinLevelItem::Animation"
    case eEquippableSkinLevelItemAttackerDefenderSwap = "EEquippableSkinLevelItem::AttackerDefenderSwap"
    case eEquippableSkinLevelItemFinisher = "EEquippableSkinLevelItem::Finisher"
    case eEquippableSkinLevelItemFishAnimation = "EEquippableSkinLevelItem::FishAnimation"
    case eEquippableSkinLevelItemHeartbeatAndMapSensor = "EEquippableSkinLevelItem::HeartbeatAndMapSensor"
    case eEquippableSkinLevelItemInspectAndKill = "EEquippableSkinLevelItem::InspectAndKill"
    case eEquippableSkinLevelItemKillBanner = "EEquippableSkinLevelItem::KillBanner"
    case eEquippableSkinLevelItemKillCounter = "EEquippableSkinLevelItem::KillCounter"
    case eEquippableSkinLevelItemKillEffect = "EEquippableSkinLevelItem::KillEffect"
    case eEquippableSkinLevelItemRandomizer = "EEquippableSkinLevelItem::Randomizer"
    case eEquippableSkinLevelItemSoundEffects = "EEquippableSkinLevelItem::SoundEffects"
    case eEquippableSkinLevelItemTopFrag = "EEquippableSkinLevelItem::TopFrag"
    case eEquippableSkinLevelItemTransformation = "EEquippableSkinLevelItem::Transformation"
    case eEquippableSkinLevelItemVFX = "EEquippableSkinLevelItem::VFX"
    case eEquippableSkinLevelItemVoiceover = "EEquippableSkinLevelItem::Voiceover"
}

// MARK: - WeaponStats
struct WeaponStats: Codable {
    var fireRate: Double
    var magazineSize: Int
    var runSpeedMultiplier: Double
    var equipTimeSeconds: Double
    var reloadTimeSeconds: Double
    var firstBulletAccuracy: Double
    var shotgunPelletCount: Int
    var wallPenetration: WallPenetration?
    var feature: String?
    var fireMode: String?
    var altFireType: AltFireType?
    var adsStats: AdsStats?
    var altShotgunStats: AltShotgunStats?
    var airBurstStats: AirBurstStats?
    var damageRanges: [DamageRange]

    enum CodingKeys: String, CodingKey {
        case fireRate = "fireRate"
        case magazineSize = "magazineSize"
        case runSpeedMultiplier = "runSpeedMultiplier"
        case equipTimeSeconds = "equipTimeSeconds"
        case reloadTimeSeconds = "reloadTimeSeconds"
        case firstBulletAccuracy = "firstBulletAccuracy"
        case shotgunPelletCount = "shotgunPelletCount"
        case wallPenetration = "wallPenetration"
        case feature = "feature"
        case fireMode = "fireMode"
        case altFireType = "altFireType"
        case adsStats = "adsStats"
        case altShotgunStats = "altShotgunStats"
        case airBurstStats = "airBurstStats"
        case damageRanges = "damageRanges"
    }
}

// MARK: - AdsStats
struct AdsStats: Codable {
    var zoomMultiplier: Double
    var fireRate: Double
    var runSpeedMultiplier: Double
    var burstCount: Int
    var firstBulletAccuracy: Double

    enum CodingKeys: String, CodingKey {
        case zoomMultiplier = "zoomMultiplier"
        case fireRate = "fireRate"
        case runSpeedMultiplier = "runSpeedMultiplier"
        case burstCount = "burstCount"
        case firstBulletAccuracy = "firstBulletAccuracy"
    }
}

// MARK: - AirBurstStats
struct AirBurstStats: Codable {
    var shotgunPelletCount: Int
    var burstDistance: Double

    enum CodingKeys: String, CodingKey {
        case shotgunPelletCount = "shotgunPelletCount"
        case burstDistance = "burstDistance"
    }
}

enum AltFireType: String, Codable {
    case eWeaponAltFireDisplayTypeADS = "EWeaponAltFireDisplayType::ADS"
    case eWeaponAltFireDisplayTypeAirBurst = "EWeaponAltFireDisplayType::AirBurst"
    case eWeaponAltFireDisplayTypeShotgun = "EWeaponAltFireDisplayType::Shotgun"
}

// MARK: - AltShotgunStats
struct AltShotgunStats: Codable {
    var shotgunPelletCount: Int
    var burstRate: Double

    enum CodingKeys: String, CodingKey {
        case shotgunPelletCount = "shotgunPelletCount"
        case burstRate = "burstRate"
    }
}

// MARK: - DamageRange
struct DamageRange: Codable {
    var rangeStartMeters: Int
    var rangeEndMeters: Int
    var headDamage: Double
    var bodyDamage: Int
    var legDamage: Double

    enum CodingKeys: String, CodingKey {
        case rangeStartMeters = "rangeStartMeters"
        case rangeEndMeters = "rangeEndMeters"
        case headDamage = "headDamage"
        case bodyDamage = "bodyDamage"
        case legDamage = "legDamage"
    }
}

enum WallPenetration: String, Codable {
    case eWallPenetrationDisplayTypeHigh = "EWallPenetrationDisplayType::High"
    case eWallPenetrationDisplayTypeLow = "EWallPenetrationDisplayType::Low"
    case eWallPenetrationDisplayTypeMedium = "EWallPenetrationDisplayType::Medium"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

