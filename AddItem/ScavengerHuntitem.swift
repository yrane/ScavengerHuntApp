//
//  ScavengerHuntitem.swift
//  AddItem
//
//  Created by apple-swift on 9/16/14.
//  Copyright (c) 2014 DevPubs. All rights reserved.
//

import Foundation

import UIKit

class ScavengerHuntitem: NSObject {
    let name: String
    
    var photo: UIImage?
    
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String){
        self.name = name
    }
    
}