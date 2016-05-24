//
//  ViewController.swift
//  Fira
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchClickDelegate{

    var selectedIndexPath:NSIndexPath!
    var selectedManuals = [Int:NSIndexPath] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPath = indexPath
        print("Hey, he seleccionat")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("userAttribute", forIndexPath: indexPath)
        if let cell = tableView.dequeueReusableCellWithIdentifier("manualCell", forIndexPath: indexPath) as? ProductTableViewCell {
            cell.delegate = self
            cell.path = indexPath
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    func onSwitchChange(active:Bool, indexPath: NSIndexPath) {
        if(active) {print("He activat el switch de la linia " + String(indexPath.row) ) }
        else {print("He DESACTIVAT el switch de la linia " + String(indexPath.row) ) }
    }
    

}

