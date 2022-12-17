//
//  HomeViewController.swift
//  ArtCreator
//
//  Created by Fatih on 24.11.2022.
//

import UIKit
import SnapKit
import Lottie
import Hero

class HomeViewController: UIViewController {
    let label = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let tableView = UITableView()
    var animationView = LottieAnimationView()
   

    let text = UITextField()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let button = UIButton()
    let buttonS = UIButton()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("reload"), object: nil)
        categori.append(Categories(cateAd: "Surrealist", cateImage: "sürreal"))
        categori.append(Categories(cateAd: "Steampunk", cateImage: "Steampunk"))
        categori.append(Categories(cateAd: "Rick and Morty", cateImage: "rickMorty"))
        categori.append(Categories(cateAd: "Renaissance Painting", cateImage: "homeArt"))
        categori.append(Categories(cateAd: "Portrait Photo", cateImage: "cocuk"))
        configure()
        createButtonTapped()
        snapKit()
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    func configure() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        label.text = "Explore"
        label.font = UIFont(name: "Inter-Regular", size: 30)
        label.textColor = UIColor(hex: "#000000")
        view.addSubview(label)
        
        label1.text = "Lorem İpsum"
        label1.font = UIFont(name: "Inter-SemiBold", size: 30)
        label1.textColor = UIColor(hex: "#000000")
        view.addSubview(label1)
        
        label2.text = "Enter Prompt"
        label2.font = UIFont(name: "Inter-Regular", size: 18)
        label2.textColor = UIColor(hex: "#000000")
        view.addSubview(label2)
        
        label3.text = "Select an Category"
        label3.font = UIFont(name: "Inter-Medium", size: 18)
        label3.textColor = UIColor(hex: "#000000")
        view.addSubview(label3)
        

        text.textColor = UIColor(hex: "#000000")
        text.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        text.layer.cornerRadius = 15
        text.layer.borderWidth = 2
        text.font = UIFont(name: "Inter-Regular", size: 14)
        text.attributedPlaceholder = NSAttributedString(string:"           Type Something...",
                                                        attributes:[NSAttributedString.Key.foregroundColor: UIColor(hex: "#6C6363")])
        
        view.addSubview(text)
        
        image1.image = UIImage(named: "timers")
        image1.contentMode = .scaleAspectFill
        image1.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognize = UITapGestureRecognizer(target: self, action: #selector(getHistory))
        image1.addGestureRecognizer(gestureRecognize)
        image1.isUserInteractionEnabled = true
        view.addSubview(image1)
        
        image2.image = UIImage(named: "IconS")
        image2.contentMode = .scaleAspectFill
        image2.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognize2 = UITapGestureRecognizer(target: self, action: #selector(getSettings))
        image2.addGestureRecognizer(gestureRecognize2)
        image2.isUserInteractionEnabled = true
        view.addSubview(image2)
        

        
        button.backgroundColor = UIColor(hex: "#E4A73E")
        button.setTitle("Select From Examples >", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        button.font(UIFont(name: "Inter-Bold", size: 12)!)
        view.addSubview(button)
        

        buttonS.backgroundColor = UIColor(hex: "#000000")
        buttonS.setTitle("Create", for: .normal)
        buttonS.layer.cornerRadius = 10
        buttonS.setTitleColor(UIColor(hex: "#F4F4F4"), for: .normal)
        buttonS.font(UIFont(name: "Inter-Bold", size: 20)!)
        buttonS.addTarget(self, action: #selector(selectButtonData), for: .touchUpInside)
        view.addSubview(buttonS)
        
        
    }
    func createAnimation(){
            animationView.animation = LottieAnimation.named("wait")
            animationView.frame = view.bounds
            animationView.backgroundColor = .white
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            view.addSubview(animationView)
            animationView.play()
        }
        @objc func selectButtonData() {

           createAnimation()



            let creation = Creation(prompt: text.text!, style: selectedCategory.cateAd!)

            APICaller().getImageFromAPI(creation: creation) { [weak self] resultImage in
                creation.resultImg = resultImage
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.animationView.removeFromSuperview()
                    let vc = DetailViewController()
                    vc.fetch = creation
                    vc.isHeroEnabled = true
                    vc.modalPresentationStyle = .fullScreen
                    vc.hero.modalAnimationType = .pageOut(direction: .left)
                    self.present(vc, animated: false)
                }
            }

        }

    
    func snapKit() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-134)
            make.size.width.equalTo(254)
            make.size.height.equalTo(50)
        }
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(74)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-134)
            make.size.width.equalTo(254)
            make.size.height.equalTo(50)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1).offset(61)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-269)
            make.size.width.equalTo(254)
            make.size.height.equalTo(50)
        }
        text.snp.makeConstraints { make in
            make.top.equalTo(label2).offset(50)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-19)
            make.size.width.equalTo(371)
            make.size.height.equalTo(45)
        }
        image2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-28)
            make.size.width.equalTo(51.67)
            make.size.height.equalTo(51.67)
        }
        image1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-73)
            make.size.width.equalTo(51.67)
            make.size.height.equalTo(51.67)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(text).offset(61)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-236)
            make.size.width.equalTo(165)
            make.size.height.equalTo(23)
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(button).offset(52)
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-207)
            make.size.width.equalTo(181)
            make.size.height.equalTo(24)
        }

        buttonS.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(800)
            make.left.equalToSuperview().offset(23)
            make.right.equalToSuperview().offset(-24)
            make.size.width.equalTo(367)
            make.size.height.equalTo(61)
        }
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(52)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalTo(buttonS).offset(-114)
        }
    }
    func fetchAnimationView() {
        
        animationView = .init(name: "wait")
        animationView.loopMode = .loop
        view.addSubviews(animationView)
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(800)
        }
        animationView.play { finished in
           
        }
        
    }
    
    @objc func reloadTableView(){
        tableView.reloadData()
    }
    
    @objc func createButtonTapped(){
        

    }
    @objc func getSettings() {
        let vc = SettingsViewController()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc, animated: true)
    }
    @objc func getHistory() {
        let vc = CollectionViewController()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .pageOut(direction: .left)
        present(vc, animated: true)
    }
    

}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        let cellName = categori[indexPath.row]
        cell.backgroundColor = .white
        cell.labelA.text = cellName.cateAd
        cell.imageA.image = UIImage(named: cellName.cateImage!)
        cell.buttonA.tag = indexPath.row
        cell.buttonA.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        
        
        if categori[indexPath.row].cateAd == selectedCategory.cateAd {
            cell.buttonA.backgroundColor = .black
            cell.buttonA.setTitle("Using", for: .normal)
            cell.buttonA.setTitleColor(UIColor(hex: "#F4F4F4"), for: .normal)
        } else {
            cell.buttonA.backgroundColor = UIColor(hex: "#E4A73E")
            cell.buttonA.setTitle("Use", for: .normal)
            cell.buttonA.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        }
        
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categori.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
