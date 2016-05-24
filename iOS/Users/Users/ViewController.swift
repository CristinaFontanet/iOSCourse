//
//  ViewController.swift
//  Users
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit
//El primer es de qui hereda, els seguents a qui implementa
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    var nam:Name!
    var user:User!
    var attributes:[String!] = ["name: ", "email: ","phone: " ]
    var attributesArray = [Attribute]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nam = Name(title: "HEEEY", first: "PRIM", last: "Seg")
        user = User(name: nam, email: "blabla@gmail.com", phone: "989887222", urlImage: "https://randomuser.me/api/portraits/men/25.jpg")
        if let URL = NSURL(string: user.urlImage) {
            userImage.image = downloadImageFromURL(URL)
        }
        else {
            userImage.image = UIImage(contentsOfFile: "userImagePlaceholder")
        }
        mapUserToAttributesArray()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapUserToAttributesArray() {
        let completeName = user.name.title + " " + user.name.first + " " + user.name.last
        attributesArray.append(Attribute(title: "Nom", value: completeName))
        attributesArray.append(Attribute(title: "phone", value: user.phone))
        attributesArray.append(Attribute(title: "email", value: user.email))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("attributeCell", forIndexPath: indexPath) as? AttributeTableViewCell {
            let attribut = attributesArray[indexPath.row]
            cell.attributeTitle.text = attribut.title
            cell.attributeValue.text = attribut.value
            return cell
        }
        return UITableViewCell()
    }
    

    func downloadImageFromURL(URL:NSURL) -> UIImage? {
        if let data = NSData(contentsOfURL: URL) {
            return UIImage(data: data)
        }
        else {
            return UIImage(contentsOfFile: "userImagePlaceholder")
        }
    }


}

