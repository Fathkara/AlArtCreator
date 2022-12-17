//
//  SettingsViewController.swift
//  ArtCreator
//
//  Created by Fatih on 29.11.2022.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    let imgBack = UIImageView()
    let label = UILabel()
    let tableView = UITableView()
    var settingValue = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        settingValue.append("Try Premium")
        settingValue.append("Privacy Policy")
        settingValue.append("Terms Of Use")
        settingValue.append("Restore Purchase")
        settingValue.append("Rate Us")
        settingValue.append("Send Feedback")
        

        
    }
    func configure() {
        imgBack.image = UIImage(named: "back")
        imgBack.contentMode = .scaleAspectFill
        imgBack.translatesAutoresizingMaskIntoConstraints = false
        imgBack.isUserInteractionEnabled = true
        let backGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backImageSelect))
        imgBack.addGestureRecognizer(backGestureRecognizer)
        view.addSubview(imgBack)
        imgBack.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(48.63)
                make.left.equalToSuperview().offset(30.27)
                make.width.equalTo(36.62)
                make.height.equalTo(46.73)
            }
        
        label.text = "Settings"
        label.font = UIFont(name: "Inter-Medium", size: 25)
        label.textColor = .black
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.left.equalTo(imgBack.snp.right).offset(105)
            make.width.equalTo(110)
            make.height.equalTo(30)
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        view.addSubview(tableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.top).offset(87)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalTo(label.snp.top).offset(446)
            
        }
    }
    @objc func backImageSelect() {
        let vc = HomeViewController()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .pageOut(direction: .left)
        present(vc, animated: true)
    }
    
}
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingValue[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingValue.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch settingValue[indexPath.row] {
        case "Try Premium":
            let vc = InAppViewController()
            vc.hero.isEnabled = true
            vc.modalPresentationStyle = .fullScreen
            vc.hero.modalAnimationType = .pageOut(direction: .left)
            present(vc, animated: true)
        case "Terms Of Use":
            guard let url = URL(string: "https://www.google.com/intl/tr/gmail/about/") else {return}
            UIApplication.shared.open(url)

        case "Send Feedback":
            guard let url = URL(string: "https://www.neonapps.co/") else {return}
            UIApplication.shared.open(url)
            
        
            
        default:
            break
        }
        
    }
}
