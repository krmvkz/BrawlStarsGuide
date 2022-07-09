//
//  SideMenuViewController.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 07.07.2022.
//

import UIKit
import SnapKit

protocol SideMenuViewControllerDelegate: AnyObject {
    func selectedCell(_ row: Int)
}

final class SideMenuViewController: UIViewController {
    weak var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0
    
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "brawlStarsGuide-logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Color.main
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var menu: [SideMenuModel] = [
        SideMenuModel(iconName: "house.fill", title: "Home"),
        SideMenuModel(iconName: "person.3.fill", title: "Brawlers"),
        SideMenuModel(iconName: "map.fill", title: "Maps"),
        SideMenuModel(iconName: "gamecontroller.fill", title: "Game Modes")
    ]
    
    override func loadView() {
        super.loadView()
        view.addSubview(headerImageView)
        view.addSubview(tableView)
        view.backgroundColor = Color.main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.tableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(150)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerImageView.snp.bottom).offset(18)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("Such cell doesn't exist") }
        cell.configureCell(with: menu[indexPath.row])
        
        // Highlighted color
        let selectionColorView = UIView()
        selectionColorView.backgroundColor = .black
        cell.selectedBackgroundView = selectionColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
    }
    
    
}

// MARK: - UITableViewDelegate
extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
