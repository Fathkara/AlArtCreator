//
//  OnBoardViewController.swift
//  ArtCreator
//
//  Created by Fatih on 22.11.2022.
//

import UIKit
import SnapKit
import SparkUI
import UIFontComplete

class OnBoardViewController: UIViewController {
    
    let imageOnboard = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let button = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Configure()
        snapKit()

    }
    
    func Configure() {
        
        imageOnboard.image = UIImage(named: "Onboarding")
        view.addSubview(imageOnboard)
        
       
        label1.text = "Welcome to"
        label1.textColor = .black
        label1.textAlignment = .center
        label1.font = UIFont(name: "Inter-Bold", size: 30)
        view.addSubview(label1)
        
       
        label2.text = "Al Art Creator"
        label2.textColor = UIColor(hex: "#000000")
        label2.textAlignment = .center
        label2.font = UIFont(name: "Inter-Regular", size: 30)
        view.addSubview(label2)
        
       
        label3.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        label3.textColor = UIColor(hex: "#6C6363")
        label3.numberOfLines = 0
        label3.textAlignment = .center
        label3.font = UIFont(name: "Inter-SemiBold", size: 15)
        view.addSubview(label3)
        
        
        button.backgroundColor = UIColor(hex: "#E4A73E")
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button.font(UIFont(name: "Inter-Bold", size: 18)!)
        button.addTarget(self, action: #selector(goToInapp), for: .touchUpInside)
        view.addSubview(button)
        
        
        
        
    }
    
    
    func snapKit() {
        imageOnboard.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-9)
            make.right.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.size.width.equalTo(414)
            make.size.height.equalTo(355)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(imageOnboard).offset(439)
            make.left.equalToSuperview().offset(121)
            make.right.equalToSuperview().offset(-119)
            make.size.width.equalTo(174)
            make.size.height.equalTo(36)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1).offset(64)
            make.left.equalToSuperview().offset(110)
            make.right.equalToSuperview().offset(-108)
            make.size.width.equalTo(196)
            make.size.height.equalTo(36)
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2).offset(129)
            make.left.equalToSuperview().offset(44)
            make.right.equalToSuperview().offset(-37)
            make.size.width.equalTo(333)
            make.size.height.equalTo(74)
            
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(201)
            make.left.equalToSuperview().offset(65)
            make.right.equalToSuperview().offset(-58)
            make.size.width.equalTo(291)
            make.size.height.equalTo(54)
        }
        
    }
    
    @objc func goToInapp() {
        let vc = InAppViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
