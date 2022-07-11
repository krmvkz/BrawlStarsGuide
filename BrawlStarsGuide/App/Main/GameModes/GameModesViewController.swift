//
//  GameModesViewController.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import UIKit
import SnapKit

final class GameModesViewController: UIViewController {
    private let viewModel = GameModesViewModel()
    
    private lazy var sideMenuButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "line.horizontal.3")
        button.tintColor = .white
        button.target = revealViewController()
        button.action = #selector(revealViewController()?.revealSideMenu)
        return button
    }()
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = Color.main
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.register(GameModeCell.self, forCellReuseIdentifier: GameModeCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func loadView() {
        super.loadView()
        title = "Game Modes"
        view.backgroundColor = Color.main
        navigationItem.setLeftBarButton(sideMenuButton, animated: false)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getBrawlers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

}

extension GameModesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = viewModel.gameModes.count
        return items
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameModeCell.identifier, for: indexPath) as? GameModeCell else {
            fatalError("Such cell doesn't exist")
        }
        let gameMode = viewModel.gameModes[indexPath.row]
        cell.configureCell(with: gameMode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
}

extension GameModesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

extension GameModesViewController: GameModesViewModelDelegate {
    func didFinishFetchingGameModes() {
        tableView.reloadData()
    }
}
