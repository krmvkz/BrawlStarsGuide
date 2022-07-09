//
//  NetworkManager.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import Foundation
import Alamofire

typealias JSON = [String: String]

private enum Constants {
    static let baseURL = URL(string: "https://api.brawlapi.com/v1")!
    static let brawlersURL = URL(string: "\(baseURL)/brawlers")!
    static let mapsURL = URL(string: "\(baseURL)/maps")!
    static let gameModesURL = URL(string: "\(baseURL)/gamemodes")!
}

struct NetworkManager {
    static let shared = NetworkManager()
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    func fetchBrawlers(completion: @escaping (Result<[Brawler], Error>) -> Void) {
        AF.request(Constants.brawlersURL).responseDecodable(of: BrawlersResponseModel.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.brawlers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchGameModes(completion: @escaping (Result<[GameMode], Error>) -> Void) {
        AF.request(Constants.gameModesURL).responseDecodable(of: GameModesResponseModel.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.gameModes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
