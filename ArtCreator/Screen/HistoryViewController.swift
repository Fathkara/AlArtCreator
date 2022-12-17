//
//  CollectionViewController.swift
//  ArtCreator
//
//  Created by Fatih on 27.11.2022.
//

import UIKit
import SnapKit
import CoreData
import Hero




class CollectionViewController: UIViewController {
    
    var creat = [CreationCore]()
    var modelS = [Creation]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let imgBack = UIImageView()
    let imgHistory = UIImageView()
    let label = UILabel()
    var collectionView: UICollectionView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createCollectionView()
        configure()
        fetchDatabase()
    }

    func createCollectionView() {
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 173,  height: 196)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 25)
        layout.minimumLineSpacing = 22
        layout.minimumInteritemSpacing = -20
        
        
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier:  CollectionViewCell.identifier)
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        guard let collectionView = collectionView else {
            return
        }

        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
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
        

        label.text = "History"
        label.font = UIFont(name: "Inter-Regular", size: 25)
        label.textColor = UIColor(hex: "#000000")
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.left.equalTo(imgBack.snp.right).offset(105)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let collectionView = collectionView else {
            return
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.width.equalTo(view.frame.size.width)
            make.height.equalTo(view.frame.size.height)
        }
    }
    
    
    func fetchDatabase() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var creation: Creation?
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CreationCore")
        fetchRequest.returnsObjectsAsFaults = false
      
        do {
            
            let results = try! context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {

                let imgData = result.value(forKey: "resultImg") as! Data
                guard let resultImg = UIImage(data: imgData) else {return}
                let prompt = result.value(forKey: "prompt") as! String
                
                creation = Creation(prompt: prompt, style: "", resultImg: resultImg)
                modelS.append(creation!)
                print(modelS.count)
            }
          
        } catch {
            print(error)
        }
        guard let collectionView = collectionView else {
            return
        }

        collectionView.reloadData()
       
    }
    
    @objc func backImageSelect() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .pageOut(direction: .right)
        present(vc, animated: true)
    }
    
    


}
extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        
        let gelenVeri = modelS[indexPath.row]
        let gelenBilgi = gelenVeri.resultImg
        
        
        cell!.image.image = gelenBilgi
        cell!.labelName.text = modelS[indexPath.item].prompt
        cell?.image.tag = indexPath.row
        cell!.layer.cornerRadius = 10
        cell!.image.layer.cornerRadius = 10
        cell!.backgroundColor = .white
        return cell!
        }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let vc = DetailViewController()
       vc.fetch = modelS[indexPath.row]
       vc.sender = "History"
       
       
    
       vc.modalPresentationStyle = .overFullScreen
       vc.hero.isEnabled = true
       vc.hero.modalAnimationType = .pageOut(direction: .right)
       present(vc, animated: true)


   }


}
    
    

