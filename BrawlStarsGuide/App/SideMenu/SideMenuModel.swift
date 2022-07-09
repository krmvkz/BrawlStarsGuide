//
//  SideMenuModel.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import UIKit

struct SideMenuModel {
    var icon: UIImage?
    var title: String
    
    init(iconName: String, title: String) {
        if let image = UIImage(named: iconName) {
            self.icon = image
        } else if let image = UIImage(systemName: iconName) {
            self.icon = image
        }
        self.title = title
    }
}
