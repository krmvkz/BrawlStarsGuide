//
//  BrawlersViewModel.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import Foundation

protocol BrawlersViewModelDelegate: AnyObject {
    //    func didStartFetchingBrawlers()
    func didFinishFetchingBrawlers()
}

final class BrawlersViewModel {
    var brawlers: [Brawler]?
    
    weak var delegate: BrawlersViewModelDelegate?
    
    func getBrawlers() {
//        delegate?.didStartFetchingBrawlers()
        NetworkManager.shared.fetchBrawlers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.brawlers = data
                self.delegate?.didFinishFetchingBrawlers()
            case .failure(let error):
                self.delegate?.didFinishFetchingBrawlers()
                fatalError(error.localizedDescription)
            }
        }
    }
}
