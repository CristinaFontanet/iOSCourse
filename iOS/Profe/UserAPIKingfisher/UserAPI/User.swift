//
//  User.swift
//  UserAPI
//
//  Created by Miguel Berrocal Gómez on 29/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import Foundation

class User {
    let name:Name
    let email:String
    let phone:String
    let imageURL:String
    
    init(name:Name,email:String,phone:String, imageURL:String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.imageURL = imageURL
    }
}