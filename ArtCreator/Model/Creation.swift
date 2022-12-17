//
//  Creation.swift
//  ArtCreator
//
//  Created by Fatih on 25.11.2022.
//

import Foundation
import UIKit



class Creation {
    

    
    var prompt: String
    var style: String
    var resultImg: UIImage?
    
    init(prompt: String, style: String, resultImg: UIImage? = nil){
        self.prompt = prompt
        self.style = style
        self.resultImg = resultImg
    }
    
}

var creat = [CreationCore]()


