//
//  GameModesVIewModel.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 09.07.2022.
//

import Foundation

protocol GameModesViewModelDelegate: AnyObject {
    func didFinishFetchingGameModes()
}

final class GameModesViewModel {
    var gameModes: [GameMode]?
    
    weak var delegate: GameModesViewModelDelegate?
    
    func getBrawlers() {
        NetworkManager.shared.fetchGameModes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.gameModes = data
                self.delegate?.didFinishFetchingGameModes()
            case .failure(let error):
                self.delegate?.didFinishFetchingGameModes()
                fatalError(error.localizedDescription)
            }
        }
    }
}
