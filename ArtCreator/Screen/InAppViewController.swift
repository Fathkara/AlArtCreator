//
//  InAppViewController.swift
//  ArtCreator
//
//  Created by Fatih on 23.11.2022.
//

import UIKit
import SnapKit


class InAppViewController: UIViewController {
    
    let imageView = UIImageView()
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    let label6 = UILabel()
    let label7 = UILabel()
    let label8 = UILabel()
    let labelA1 = UILabel()
    let labelA2 = UILabel()
    let labelA3 = UILabel()
    let labelA4 = UILabel()
    let labelA5 = UILabel()
    let button = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        snapKit()
        
    }
    func configure() {
        imageView.image = UIImage(named: "InApp")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView1.image = UIImage(named: "Icon_Inapp")
        imageView1.contentMode = .scaleAspectFill
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView1)
        
        imageView2.image = UIImage(named: "Icon_Inapp")
        imageView2.contentMode = .scaleAspectFill
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView2)
        
        imageView3.image = UIImage(named: "Icon_Inapp")
        imageView3.contentMode = .scaleAspectFill
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView3)
        
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "btn_cross"), for: .normal)
        button.setTitleColor(UIColor(hex: "#0B0B0B"), for: .normal)
        button.addTarget(self, action: #selector(barButton), for: .touchUpInside)
        view.addSubview(button)
        
        button1.setTitle("", for: .normal)
        button1.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button1.layer.borderWidth = 3
        button1.layer.borderColor = UIColor(hex: "#000000").cgColor
        button1.layer.cornerRadius = 10
        view.addSubview(button1)
        
        button2.setTitle("", for: .normal)
        button2.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor(hex: "#000000").cgColor
        button2.layer.cornerRadius = 10
        view.addSubview(button2)
        
        button3.setTitle("Start", for: .normal)
        button3.setTitleColor(UIColor(hex: "#F4F4F4"), for: .normal)
        button3.backgroundColor = UIColor(hex: "#000000")
        button3.font(UIFont(name: "Inter-Bold", size: 18)!)
        //button3.layer.borderColor = UIColor(hex: "#000000").cgColor
        button3.layer.cornerRadius = 10
        button3.addTarget(self, action: #selector(homeSelectButton), for: .touchUpInside)
        view.addSubview(button3)

        label1.text = "Explore PREMIUM"
        label1.textColor = UIColor(hex: "#000000")
        label1.textAlignment = .center
        label1.font = UIFont(name: "Inter-Bold", size: 30)
        view.addSubview(label1)
        
        label2.text = "Unleash your creativity with PRO experience"
        label2.numberOfLines = 0
        label2.textColor = UIColor(hex: "#4F4F4F")
        label2.textAlignment = .center
        label2.font = UIFont(name: "Inter-Regular", size: 15)
        view.addSubview(label2)
        
        label3.text = "Fast proccessing"
        label3.textColor = UIColor(hex: "#000000")
        label3.textAlignment = .center
        label3.font = UIFont(name: "Inter-Regular", size: 16)
        view.addSubview(label3)
        
        label4.text = "Un limited artwork creation"
        label4.textColor = UIColor(hex: "#000000")
        label4.textAlignment = .center
        label4.font = UIFont(name: "Inter-Regular", size: 16)
        view.addSubview(label4)
        
        label5.text = "Get multiple results"
        label5.textColor = UIColor(hex: "#000000")
        label5.textAlignment = .center
        label5.font = UIFont(name: "Inter-Regular", size: 16)
        view.addSubview(label5)
        
        
        label6.numberOfLines = 0
        label6.textColor = UIColor(hex: "#3D3D3D")
        label6.textAlignment = .center
        label6.font = UIFont(name: "Inter-Regular", size: 12)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Terms of Use", attributes: underlineAttribute)
        label6.attributedText = underlineAttributedString
        view.addSubview(label6)
 
        label7.text = "Restore Purchase"
        label7.numberOfLines = 0
        label7.textColor = UIColor(hex: "#3D3D3D")
        label7.textAlignment = .center
        label7.font = UIFont(name: "Inter-Regular", size: 12)
        let underlineAttributeOne = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedStringOne = NSAttributedString(string: "Restore Purchase", attributes: underlineAttributeOne)
        label7.attributedText = underlineAttributedStringOne
        view.addSubview(label7)
        
        
        label8.numberOfLines = 0
        label8.textColor = UIColor(hex: "#3D3D3D")
        label8.textAlignment = .center
        label8.font = UIFont(name: "Inter-Regular", size: 12)
        let underlineAttributeTwo = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedStringTwo = NSAttributedString(string: "Privacy Policy", attributes: underlineAttributeTwo)
        label8.attributedText = underlineAttributedStringTwo
     
        view.addSubview(label8)
        
        labelA1.text = "3 Days Free Trial"
        labelA1.numberOfLines = 0
        labelA1.textColor = UIColor(hex: "#4F4F4F")
        labelA1.textAlignment = .center
        labelA1.font = UIFont(name: "Inter-Regular", size: 13)
        view.addSubview(labelA1)
        
        labelA2.text = "Weekly Plan"
        labelA2.textColor = UIColor(hex: "#000000")
        labelA2.textAlignment = .center
        labelA2.font = UIFont(name: "Inter-Medium", size: 14)
        view.addSubview(labelA2)
        
        labelA3.text = "$3.99"
        labelA3.textColor = UIColor(hex: "#000000")
        labelA3.textAlignment = .center
        labelA3.font = UIFont(name: "Inter-Bold", size: 16)
        view.addSubview(labelA3)
        
        labelA4.text = "Yearly Plan"
        labelA4.textColor = UIColor(hex: "#000000")
        labelA4.textAlignment = .center
        labelA4.font = UIFont(name: "Inter-Medium", size: 15)
        view.addSubview(labelA4)
        
        labelA5.text = "$29.99"
        labelA5.textColor = UIColor(hex: "#000000")
        labelA5.textAlignment = .center
        labelA5.font = UIFont(name: "Inter-Bold", size: 16)
        view.addSubview(labelA5)
        
    }
    
    
    
    func snapKit() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.size.width.equalTo(413)
            make.size.height.equalTo(474)
            
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(0)
            make.right.equalTo(imageView).offset(-15)
            make.size.width.equalTo(50.33)
            make.size.height.equalTo(50.33)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(312)
            make.left.equalToSuperview().offset(78)
            make.right.equalToSuperview().offset(-76)
            make.size.width.equalTo(259)
            make.size.height.equalTo(40)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1).offset(60)
            make.left.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-54)
            make.size.width.equalTo(315)
            make.size.height.equalTo(18)
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2).offset(46)
            make.left.equalToSuperview().offset(120)
            make.right.equalToSuperview().offset(-163)
            make.size.width.equalTo(131)
            make.size.height.equalTo(21)
        }
        label4.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(38)
            make.left.equalToSuperview().offset(120)
            make.right.equalToSuperview().offset(-86)
            make.size.width.equalTo(288)
            make.size.height.equalTo(21)
        }
        label5.snp.makeConstraints { make in
            make.top.equalTo(label4).offset(38)
            make.left.equalToSuperview().offset(120)
            make.right.equalToSuperview().offset(-145)
            make.size.width.equalTo(149)
            make.size.height.equalTo(21)
        }
        imageView1.snp.makeConstraints { make in
            make.top.equalTo(label2).offset(44)
            make.left.equalToSuperview().offset(92)
            make.size.width.equalTo(40.33)
            make.size.height.equalTo(25.33)
        }
        imageView2.snp.makeConstraints { make in
            make.top.equalTo(imageView1).offset(38)
            make.left.equalToSuperview().offset(92)
            make.size.width.equalTo(40.33)
            make.size.height.equalTo(25.33)
        }
        imageView3.snp.makeConstraints { make in
            make.top.equalTo(imageView2).offset(38)
            make.left.equalToSuperview().offset(92)
            make.size.width.equalTo(40.33)
            make.size.height.equalTo(25.33)
        }
        button1.snp.makeConstraints { make in
            make.top.equalTo(label5).offset(50)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-24)
            make.size.width.equalTo(356)
            make.size.height.equalTo(69)
        }
        button2.snp.makeConstraints { make in
            make.top.equalTo(button1).offset(90)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-24)
            make.size.width.equalTo(356)
            make.size.height.equalTo(69)
        }
        button3.snp.makeConstraints { make in
            make.top.equalTo(button2).offset(113)
            make.left.equalToSuperview().offset(62)
            make.right.equalToSuperview().offset(-61)
            make.size.width.equalTo(291)
            make.size.height.equalTo(54)
        }
        label6.snp.makeConstraints { make in
            make.top.equalTo(button3).offset(75)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-303)
            make.size.width.equalTo(71)
            make.size.height.equalTo(17)
        }
        label7.snp.makeConstraints { make in
            make.top.equalTo(button3).offset(75)
            make.left.equalToSuperview().offset(160)
            make.right.equalToSuperview().offset(-158)
            make.size.width.equalTo(71)
            make.size.height.equalTo(17)
        }
        label8.snp.makeConstraints { make in
            make.top.equalTo(button3).offset(75)
            make.left.equalToSuperview().offset(306)
            make.right.equalToSuperview().offset(-33)
            make.size.width.equalTo(71)
            make.size.height.equalTo(17)
        }
        labelA1.snp.makeConstraints { make in
            make.top.equalTo(button1).offset(15)
            make.left.equalTo(button1).offset(19)
        }
        labelA2.snp.makeConstraints { make in
            make.top.equalTo(labelA1).offset(20)
            make.left.equalTo(button1).offset(19)
        }
        labelA3.snp.makeConstraints { make in
            make.top.equalTo(button1).offset(24)
            make.right.equalTo(button1).offset(-27)
        }
        labelA4.snp.makeConstraints { make in
            make.top.equalTo(button2).offset(24)
            make.left.equalTo(button2).offset(19)
        }
        labelA5.snp.makeConstraints { make in
            make.top.equalTo(button2).offset(24)
            make.right.equalTo(button2).offset(-27)
        }
        
    }
    
    
    @objc func barButton() {
        let vc = OnBoardViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    @objc func homeSelectButton() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
