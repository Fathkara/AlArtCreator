//
//  TableViewCell.swift
//  ArtCreator
//
//  Created by Fatih on 24.11.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    
    let labelA = UILabel()
    let imageA = UIImageView()
    let buttonA = UIButton()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
        contentView.addSubview(labelA)
        
        contentView.addSubview(imageA)
        
        contentView.addSubview(buttonA)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
            labelA.text = ""
            labelA.font = UIFont(name: "Inter-Bold", size: 15)
            labelA.textColor = UIColor(hex: "#000000")
            contentView.addSubview(labelA)
 

            imageA.image = UIImage(named: "sürreal")
            imageA.contentMode = .scaleAspectFill
            imageA.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(imageA)
            
        buttonA.setTitle("Use", for: .normal)
        buttonA.font(UIFont(name: "Inter-Bold", size: 15)!)
        buttonA.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        buttonA.backgroundColor = UIColor(hex: "#E4A73E")
        buttonA.layer.cornerRadius = 10
        
        
        buttonA.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
      
        contentView.addSubview(buttonA)
        
        
        


    }
    @objc func selectButton(_ sender:UIButton) {

        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        selectedCategory = categori[indexPath.row]
        print(selectedCategory.cateAd!)
        
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
        
    }
 
   
    override func layoutSubviews() {
        super.layoutSubviews()
        imageA.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(23)
            make.size.width.equalTo(70)
            make.size.height.equalTo(70)
        }

        labelA.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35)
            make.left.equalToSuperview().offset(113)
            make.right.equalToSuperview().offset(-140)
            make.width.equalTo(83)
            make.height.equalTo(15)
        
        buttonA.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(286)
            make.right.equalToSuperview().offset(-23)
            make.width.equalTo(100)
            make.height.equalTo(31)
        }

        
        
    }
    
}

}
