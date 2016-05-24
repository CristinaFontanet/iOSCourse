//
//  UsersViewController.swift
//  Users
//
//  Created by 1181432 on 29/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var nam = Name(title: "HEEEY", first: "PRIM", last: "Seg")
    var users: [User]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let us = User(name: nam, email: "blabla@gmail.com", phone: "989887222", urlImage: "https://randomuser.me/api/portraits/men/25.jpg")
        users = [us,us,us,us,us,us,us,us,us,us,us,us,us,us,us,us,us]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonClicked() {
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
  /*  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rowIndexPathAux = indexPath.row
        performSegueWithIdentifier("showDetails", sender: self)
    } */

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as? OneTableViewCell {
            let attribut = users[indexPath.row]
            if let URL = NSURL(string: attribut.urlImage) {
                downloadImageFromURL(URL, completionHandler: { (image) -> Void in
                    if let unwrappedImage = image {
                        cell.userImage.image = unwrappedImage
                    }
                    else {
                        cell.userImage.image = UIImage(contentsOfFile: "userImagePlaceholder")
                    }
                        
                })
            }
            else {
                cell.userImage.image = UIImage(contentsOfFile: "userImagePlaceholder")
            }
            cell.userName.text = attribut.completeName()
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

    func downloadImageFromURL(URL:NSURL, completionHandler:(image:UIImage?)->Void) {
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: URL)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            guard error == nil else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler(image:nil)
                })
                return
            }
            if let unwrappedData = data {
                //per tornar al thread principal
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let image = UIImage(data: unwrappedData)
                    completionHandler(image: image)
                })
                return
            }
        }
        //per iniciar el thread 
        task.resume()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.size.height/4.0
    }

}
