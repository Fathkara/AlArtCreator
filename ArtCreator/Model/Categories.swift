//
//  Categories.swift
//  ArtCreator
//
//  Created by Fatih on 24.11.2022.
//

import Foundation

class Categories {
    static let shared = Categories()
    
    var cateAd:String? 
    var cateImage:String?
   
    
    init(cateAd:String = "" ,cateImage:String = "") {
        self.cateAd = cateAd
        self.cateImage = cateImage
    }
    

}

var categori = [Categories]()
var selectedCategory = Categories()
