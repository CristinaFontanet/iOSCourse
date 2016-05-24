//
//  Name.swift
//  Users
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import Foundation

class Name {
    let title:String
    var first:String
    var last:String
    
    init(title:String, first:String, last:String) {
        self.title=title
        self.first = first
        self.last = last
    }
    
    func completeName()->String {
        let prova = title + first + " " + last
        return prova
    }
    
}
