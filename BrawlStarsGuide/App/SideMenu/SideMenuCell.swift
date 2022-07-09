//
//  SideMenuCell.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import UIKit
import SnapKit

final class SideMenuCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .lilitaOneFont(ofSize: 17)
        label.contentMode = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(13)
            make.trailing.equalToSuperview().offset(13)
        }
    }

}

extension SideMenuCell {
    func configureCell(with model: SideMenuModel) {
        iconImageView.image = model.icon
        titleLabel.text = model.title
    }
}
