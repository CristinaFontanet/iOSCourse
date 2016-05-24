//
//  UserListViewController.swift
//  UserAPI
//
//  Created by Miguel Berrocal Gómez on 29/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var rowIndexPathAux:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewRandomUser()
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
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name.first
        cell.imageView?.image = UIImage(named: "user_placeholder")
        let imageURL = NSURL(string: user.imageURL)!
        Network.downloadImageWithUrl(imageURL) { image in
            cell.imageView?.image = image
        }
        return cell
    }
    
    @IBAction func onButtonClicked() {
        addNewRandomUser()
    }

    
    func addNewRandomUser() {
        Network.downloadUser { (newUser) -> Void in
            if let unwrappedUser = newUser {
                self.users.insert(unwrappedUser, atIndex: 0)
                dispatch_async(dispatch_get_main_queue(), {                                             ////MAGIA NEGRRAAAAAAAAAAAA x tornar al thread principal
                    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                    self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
//                    self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
                })
                
            }
        }

    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rowIndexPathAux = indexPath.row
        performSegueWithIdentifier("showDetails", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        print(segueIdentifier)
        
        switch segueIdentifier {
        case "showDetails":
            let destination = segue.destinationViewController as! ViewController
            destination.user = self.users[rowIndexPathAux]
        default: break
        }
        
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
