//
//  ViewController.swift
//  HelloWorld2
//
//  Created by 1181432 on 25/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var superLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        superLable.text = "Felicitats!"
        self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha:1)
        
    }   

}

