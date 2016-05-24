//
//  User.swift
//  Users
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import Foundation

class User {
    var name:Name
    var email:String
    var phone:String
    var urlImage:String
    
    init(name:Name, email:String, phone:String, urlImage:String) {
        self.name=name
        self.email = email
        self.phone = phone
        self.urlImage = urlImage
        
    }
    
    func completeName() ->String {
        return name.completeName()
    }
    
}