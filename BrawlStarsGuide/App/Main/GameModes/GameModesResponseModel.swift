//
//  GameModesResponseModel.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 09.07.2022.
//

// MARK: - GameModesResponseModel
struct GameModesResponseModel: Decodable {
    let gameModes: [GameMode]
    
    enum CodingKeys: String, CodingKey {
        case gameModes = "list"
    }
}

// MARK: - GameMode
struct GameMode: Decodable {
    let id: Int
    let name, hash: String
    let scHash: String?
    let disabled: Bool
    let color: String
    let version: Int
    let title: String
    let tutorial: String
    let modeDescription: String
    let shortDescription: String
    let sort1, sort2: Int
    let link: String
    let modeIconURL: String
    let headerImageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name, hash, scHash, disabled, color, version, title, tutorial
        case modeDescription = "description"
        case shortDescription, sort1, sort2, link
        case modeIconURL = "imageUrl"
        case headerImageURL = "imageUrl2"
    }
}
