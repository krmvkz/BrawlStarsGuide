//
//  HomeViewController.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 07.07.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    private lazy var sideMenuButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "line.horizontal.3")
        button.tintColor = .white
        button.target = revealViewController()
        button.action = #selector(revealViewController()?.revealSideMenu)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        title = "Home"
        view.backgroundColor = Color.main
        navigationItem.setLeftBarButton(sideMenuButton, animated: false)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

