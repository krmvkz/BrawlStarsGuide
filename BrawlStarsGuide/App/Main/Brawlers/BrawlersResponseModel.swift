//
//  BrawlersResponseModel.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import Foundation

// MARK: - BrawlersResponseModel
struct BrawlersResponseModel: Decodable {
    let brawlers: [Brawler]
    
    enum CodingKeys: String, CodingKey {
        case brawlers = "list"
    }
}

// MARK: - Brawler
struct Brawler: Decodable {
    let id, avatarID: Int
    let name, hash, path: String
    let released: Bool
    let version: Int
    let link: String
    let imageURL, imageURL2, imageURL3: String
    let brawlerClass: Class
    let rarity: Rarity
    let unlock: Int?
    let brawlerDescription: String?
    let starPowers, gadgets: [Gadget]
    let videos: [Video]

    enum CodingKeys: String, CodingKey {
        case id
        case avatarID = "avatarId"
        case name, hash, path, released, version, link
        case imageURL = "imageUrl"
        case imageURL2 = "imageUrl2"
        case imageURL3 = "imageUrl3"
        case brawlerClass = "class"
        case rarity, unlock
        case brawlerDescription = "description"
        case starPowers, gadgets, videos
    }
}

// MARK: - Gadget
struct Gadget: Codable {
    let id: Int
    let name, path: String
    let version: Int
    let gadgetDescription: String
    let imageURL: String
    let released: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, path, version
        case gadgetDescription = "description"
        case imageURL = "imageUrl"
        case released
    }
}

// MARK: - Class
struct Class: Codable {
    let id: Int
    let name: String
}

// MARK: - Rarity
struct Rarity: Codable {
    let id: Int
    let name: String
    let color: String
}

// MARK: - Video
struct Video: Decodable {
    let type: Int
    let name: String
    let videoDescription: String
    let duration: String
    let videoURL: String
    let previewURL: String
    let uploadDate: String

    enum CodingKeys: String, CodingKey {
        case type, name
        case videoDescription = "description"
        case duration
        case videoURL = "videoUrl"
        case previewURL = "previewUrl"
        case uploadDate
    }
}


