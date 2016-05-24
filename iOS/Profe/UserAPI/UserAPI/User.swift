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
    
    init?(jsonDictionary: [String : AnyObject]) {
        if let results = jsonDictionary["results"] as? [[String:AnyObject]] {
            let data = results[0]
            if let userData = data["user"] as? [String:AnyObject] {
                if let mail = userData["email"] as? String, let phone = userData["phone"] as? String,
                    let name = userData["name"] as? [String:AnyObject], let imageURL = userData["picture"] as? [String:AnyObject]{
                        if let title = name["title"] as? String, let first = name["first"] as? String, let last = name["last"] as? String {
                            if let photo = imageURL["large"] as? String {
                                let nameObj = Name(title: title, first: first, last: last)
                                self.name = nameObj
                                self.email = mail
                                self.phone = phone
                                self.imageURL = photo
                                return
                            }
                        }
                }
            }
        }
        let nameObj = Name(title: " ", first: " ", last: " ")
        self.name = nameObj
        self.email = " "
        self.phone = " "
        self.imageURL = " "
        return nil
    }
    
}