//
//  BrawlerCell.swift
//  BrawlStarsGuide
//
//  Created by Arman Karimov on 08.07.2022.
//

import UIKit
import Kingfisher
import SkeletonView

final class BrawlerCell: UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    
    private lazy var rarityLabel: UILabel = {
        let label = UILabel()
        label.font = .lilitaOneFont(ofSize: 13)
        label.textColor = .white
//        label.isSkeletonable = true
        return label
    }()
    private lazy var rarityWrapView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 11
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner
        ]
        return view
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .lilitaOneFont(ofSize: 24)
        label.textColor = .white
        label.isSkeletonable = true
        return label
    }()
    private lazy var classLabel: UILabel = {
        let label = UILabel()
        label.font = .lilitaOneFont(ofSize: 13)
        label.textColor = .white
        label.isSkeletonable = true
        return label
    }()
    private lazy var brawlerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.cornerCurve = .continuous
        imageView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        imageView.clipsToBounds = true
        imageView.isSkeletonable = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isSkeletonable = true
        contentView.isSkeletonable = true
        rarityWrapView.isSkeletonable = true
        contentView.addSubview(rarityWrapView)
        rarityWrapView.addSubview(rarityLabel)
        contentView.addSubview(brawlerImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(classLabel)
        
        rarityWrapView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 22)
        rarityLabel.frame = CGRect(x: 16, y: 0, width: rarityWrapView.frame.width - 16, height: 20)
        brawlerImageView.frame = CGRect(x: 0, y: 20, width: contentView.frame.width, height: contentView.frame.width)
        nameLabel.frame = CGRect(x: 16, y: 38, width: contentView.frame.width, height: 30)
        classLabel.frame = CGRect(x: 16, y: 70, width: contentView.frame.width, height: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BrawlerCell {
    func configureCell(with model: Brawler?) {
        guard let model = model else { return }
//        rarityLabel.text = model.rarity.name
//        nameLabel.text = model.name
//        classLabel.text = model.brawlerClass.name
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth : -4,
        ]
        
        nameLabel.attributedText = NSAttributedString(
            string: model.name,
            attributes: strokeTextAttributes
        ).uppercased()
        
        rarityLabel.attributedText = NSAttributedString(
            string: model.rarity.name,
            attributes: strokeTextAttributes
        ).uppercased()
        
        
        nameLabel.attributedText = NSAttributedString(
            string: model.name,
            attributes: strokeTextAttributes
        ).uppercased()
        
        classLabel.attributedText = NSAttributedString(
            string: model.brawlerClass.name,
            attributes: strokeTextAttributes
        ).uppercased()
        
        rarityWrapView.backgroundColor = UIColor(hex: model.rarity.color)
        
        let url = URL(string: model.imageURL2)
        brawlerImageView.kf.setImage(with: url)
    }
}
