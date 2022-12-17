//
//  CollectionViewCell.swift
//  ArtCreator
//
//  Created by Fatih on 27.11.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    var modelS = [Creation]()
    
    
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.backgroundColor = UIColor(r: 55, g: 52, b: 52, a: 0.5)
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image.addSubview(labelName)
        contentView.addSubview(image)
        config()
        
    }
    
    
   
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.width.equalTo(173)
            make.height.equalTo(196)
        }
        labelName.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top).offset(150)
            make.center.equalToSuperview()
            make.width.equalTo(173)
            make.height.equalTo(50)
        }
    }
    
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func configure() {
////        label.font = UIFont(name: "Inter-Regular", size: 16)
////        label.layer.cornerRadius = 10
////        label.textColor = UIColor(hex: "#000000")
////        label.textAlignment = .center
////        label.snp.makeConstraints { make in
////            make.top.equalTo(image.snp.bottom).offset(170)
////            make.left.equalToSuperview().offset(30)
////            make.width.equalTo(175)
////            make.height.equalTo(30)
////        }
////
//
//        image.contentMode = .scaleAspectFill
//        image.backgroundColor = .white
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
////        image.snp.makeConstraints { make in
////            make.top.equalTo(110)
////            make.left.equalToSuperview().offset(25.92)
////            make.width.equalTo(173)
////            make.height.equalTo(196)
////        }
//
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        image.frame = CGRect(x: 0, y: 5, width: contentView.frame.size.width-5, height: contentView.frame.size.height * 0.6)
//
//        //label.frame = CGRect(x: 0 * image.bounds.width, y: 0.82 * image.bounds.height  , width:contentView.frame.size.width-5 , height: 40)
//    }


