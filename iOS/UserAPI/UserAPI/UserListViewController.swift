//
//  UserListViewController.swift
//  UserAPI
//
//  Created by Miguel Berrocal Gómez on 29/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var users = [User(name:
        Name(title: "Mr.", first: "Miguelin", last: "el grande"),
        email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/20.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/21.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/22.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/23.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/10.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/11.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/12.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/13.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/14.jpg"),
        User(name:
            Name(title: "Mr.", first: "Miguelin", last: "el grande"),
            email: "cursos@ios.jediupc.com", phone: "+34 98233234", imageURL:"https://randomuser.me/api/portraits/men/15.jpg")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("simpleCell")!
        
        Network.downloadUser { (newUser) -> Void in
            if let user = newUser {
                cell.textLabel?.text = user.name.first
                cell.imageView?.image = UIImage(named: "user_placeholder")
                let imageURL = NSURL(string: user.imageURL)!
                Network.downloadImageWithUrl(imageURL) { image in
                    cell.imageView?.image = image
                }
            }
        }
        return cell
    }
    

    
    
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
