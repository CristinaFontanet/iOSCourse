//
//  CellData.swift
//  ExerciciTaula
//
//  Created by 1181432 on 2/2/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class CellData {
    var text:String
    var color:UIColor
    
    init(text:String) {
        self.text = text;
        self.color = UIColor.whiteColor()
    }
    
    init(text:String, color:UIColor) {
        self.text = text;
        self.color = color;
    }
    
}