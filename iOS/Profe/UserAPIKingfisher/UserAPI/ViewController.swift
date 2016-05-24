//
//  ViewController.swift
//  UserAPI
//
//  Created by Miguel Berrocal Gómez on 29/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var userPictureImageView: UIImageView!
    
    var user = User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
        email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/25.jpg")
    
    var attributesArray = [Attribute]()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapUserToAttributeArray()
        
        if let url = NSURL(string: user.imageURL) {
            downloadImageWithUrl(url) { picture in
                self.userPictureImageView.image = picture
            }
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapUserToAttributeArray() {
        let name = user.name.title + " " + user.name.first + " " + user.name.last
        attributesArray.append(Attribute(title: "Name:", value: name))
        attributesArray.append(Attribute(title: "e-mail:", value: user.email))
        attributesArray.append(Attribute(title: "Phone:", value:user.phone))
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("userAttribute") as? UserAttributeTableViewCell {
            let attribute = attributesArray[indexPath.row]
            cell.attributeTitleLabel.text = attribute.title
            cell.attributeValueLabel.text = attribute.value
            return cell
        }
        return UITableViewCell()
    }
    
    func downloadImageWithUrl(url: NSURL, completionHandler:(image: UIImage?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request){ (data, response, error) -> Void in
            if (error == nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    let image = UIImage(data: data!)
                    completionHandler(image: image)
                })
            } else {
                completionHandler(image: nil)
            }
        }
        task.resume()
    }

}

