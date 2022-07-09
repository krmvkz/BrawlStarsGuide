//
//  BrawlersViewController.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import UIKit
import SnapKit

final class BrawlersViewController: UIViewController {
    private var viewModel = BrawlersViewModel()
    
    private lazy var sideMenuButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "line.horizontal.3")
        button.tintColor = .white
        button.target = revealViewController()
        button.action = #selector(revealViewController()?.revealSideMenu)
        return button
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Color.main
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BrawlerCell.self, forCellWithReuseIdentifier: BrawlerCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func loadView() {
        super.loadView()
        title = "Brawlers"
        view.backgroundColor = Color.main
        navigationItem.setLeftBarButton(sideMenuButton, animated: false)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Color.main
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            navigationController?.navigationBar.tintColor = .white
        }
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getBrawlers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }

}

extension BrawlersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let items = viewModel.brawlers?.count {
            return items
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrawlerCell.identifier, for: indexPath) as? BrawlerCell else {
            fatalError("Such cell doesn't exist")
        }
        let brawler = viewModel.brawlers?[indexPath.row]
        cell.configureCell(with: brawler)
        return cell
    }
}

extension BrawlersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width) / 2 - 10
        let height = width + 30
        let size = CGSize(width: width, height: height)
        return size
    }
    
}

extension BrawlersViewController: BrawlersViewModelDelegate {
    func didFinishFetchingBrawlers() {
        print(viewModel.brawlers)
        collectionView.reloadData()
    }
    
}
