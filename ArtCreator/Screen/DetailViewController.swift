//
//  DetailViewController.swift
//  ArtCreator
//
//  Created by Fatih on 25.11.2022.
//

import UIKit
import Photos
import SnapKit
import Lottie
import CoreData
class DetailViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let modelS:[Creation] = [Creation]()
    var sender = ""
    
    static let shared = DetailViewController()
    let label = UILabel()
    let backImage = UIImageView()
    let downImage = UIImageView()
    let image = UIImageView()
    
    var fetch: Creation?
    
    
    let imageDownload = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        snapKit()
        if sender != "History" {
            saveData()
            //sender = ""
        }
        
    
    }

    func configure() {
        backImage.image = UIImage(named: "back")
        backImage.contentMode = .scaleAspectFill
        backImage.translatesAutoresizingMaskIntoConstraints = false
        let backGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backImageSelect))
        backImage.addGestureRecognizer(backGestureRecognizer)
        backImage.isUserInteractionEnabled = true
        view.addSubview(backImage)
        
        downImage.image = UIImage(named: "save")
        downImage.contentMode = .scaleAspectFill
        downImage.translatesAutoresizingMaskIntoConstraints = false
        let downGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(downImageSelect))
        downImage.addGestureRecognizer(downGestureRecognizer)
        downImage.isUserInteractionEnabled = true
        view.addSubview(downImage)
        
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.text = fetch?.prompt
        label.textColor = UIColor(hex: "#000000")
        view.addSubview(label)
        
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.image = fetch?.resultImg
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        
        
    }
   
    func snapKit() {
        
        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48.63)
            make.left.equalToSuperview().offset(30.27)
            make.width.equalTo(34.62)
            make.height.equalTo(43.73)
        }
        downImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48.63)
            make.right.equalTo(backImage.snp.left).offset(372)
            make.width.equalTo(34.62)
            make.height.equalTo(43.73)
        }
      
        image.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(24.63)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(363)
            make.height.equalTo(626)
        }
       label.snp.makeConstraints { make in
           make.top.equalTo(image.snp.bottom).offset(14)
           make.left.equalToSuperview().offset(168)
           make.right.equalToSuperview().offset(-167)
           make.size.width.equalTo(79)
           make.size.height.equalTo(18)
       }
    }
    func AnimationView() {
        var animationView = LottieAnimationView()
        animationView = .init(name: "wait")
        animationView.loopMode = .playOnce
        view.addSubviews(animationView)
        animationView.play { finished in
            
        }
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(800)
        }
        
    }
    func saveData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.entity(forEntityName: "CreationCore", in: context) 
        
        if let newUser = newUser {
            
            let newData = NSManagedObject(entity: newUser, insertInto: context)
            newData.setValue(label.text, forKey: "prompt")
            newData.setValue(image.image?.jpegData(compressionQuality:1), forKey: "resultImg")
            
        }
        do {
            try context.save()
            print("dasdads")
        } catch  {
            print("hata")
        }
    }
    
    @objc func backImageSelect() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc, animated: true)
        
    }
    @objc func downImageSelect() {
        guard let image = fetch?.resultImg else {return}
        let saveImage = image
        PHPhotoLibrary.shared().performChanges {
            _ = PHAssetChangeRequest.creationRequestForAsset(from: saveImage)
        } completionHandler: { success, error in
            guard  error == nil else {return}
            
            DispatchQueue.main.async {
                if success {
                    let action = UIAlertController(title: "Artwork saved successfully!", message: "The Al-generated artwork you created has been successfully saved the photos", preferredStyle: .alert)
                    action.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (_) in
                        print("kaydedildi")
                    }))
                    self.present(action, animated: true)
                }
            }
          
        }

        
//
//        let action = UIAlertController(title: "Artwork saved successfully!", message: "The Al-generated artwork you created has been successfully saved the photos", preferredStyle: .alert)
//        action.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (_) in
//            print("kaydedildi")
//        }))
//        present(action, animated: true)
        
    }
    

}
