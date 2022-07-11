//
//  GameModeCell.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 09.07.2022.
//

import UIKit
import Kingfisher

final class GameModeCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    private lazy var wrapView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()
    private lazy var modeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .lilitaOneFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .lilitaOneFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.cornerCurve = .continuous
        imageView.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner
        ]
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.addSubview(wrapView)
        wrapView.addSubview(modeImageView)
        wrapView.addSubview(nameLabel)
        wrapView.addSubview(titleLabel)
        contentView.addSubview(headerImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        wrapView.frame = CGRect(x: 0, y: 5, width: contentView.frame.width, height: contentView.frame.height/2)
        modeImageView.frame = CGRect(x: 5, y: 5, width: wrapView.frame.height - 16, height: wrapView.frame.height - 16)
        nameLabel.frame = CGRect(x: modeImageView.frame.width + 16, y: 10, width: wrapView.frame.width - modeImageView.frame.width - 26, height: 20)
        titleLabel.frame = CGRect(x: modeImageView.frame.width + 16, y: nameLabel.frame.height + 10, width: wrapView.frame.width - modeImageView.frame.width - 26, height: 20)
        headerImageView.frame = CGRect(x: 0, y: contentView.frame.height/2, width: wrapView.frame.width, height: contentView.frame.height/2 - 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GameModeCell {
    func configureCell(with model: GameMode?) {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 0
        shadow.shadowOffset = CGSize(width: 0, height: 5)
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .shadow: shadow
        ]
        
        guard let model = model else { return }
        
        wrapView.backgroundColor = UIColor(hex: model.color)
        nameLabel.attributedText = NSAttributedString(string: model.name, attributes: textAttributes).uppercased()
        titleLabel.attributedText = NSAttributedString(string: model.title, attributes: textAttributes)
        if let iconURL = URL(string: model.modeIconURL),
           let headerURL = URL(string: model.headerImageURL) {
            modeImageView.kf.setImage(with: iconURL)
            headerImageView.kf.setImage(with: headerURL)
        }
        
    }
}
