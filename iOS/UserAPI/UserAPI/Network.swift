//
//  Network.swift
//  UserAPI
//
//  Created by 1181432 on 1/2/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit


class Network {
    
    
    static func downloadImageWithUrl(url: NSURL, completionHandler:(image: UIImage?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
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
    
    static func downloadUser(completionHandler:(user: User?) -> Void)->Void {
      //    let urlString = "www.randomuser.me/api"
        let urlString = "file:///home2/users/alumnes/1181432/Library/Mobile%20Documents/com~apple~CloudDocs/user"
        let url = NSURL(string: urlString)!
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            guard error == nil else {
                return
            }
            print("HEY 11111")
            if let unwrappedData = data {
                var jsonDictionary = [String:AnyObject]()
                do {
                    jsonDictionary = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: NSJSONReadingOptions()) as! [String:AnyObject]
                    
                    print("HEY 333333")
                    if let results = jsonDictionary["results"] as? [[String:AnyObject]] {
                        let userData = results[0]
                        if let mail = userData["email"] as? String, let name = userData["name"] as? [String:AnyObject],
                        let phone = userData["phone"] as? String, let imageURL = userData["picture"] as? [String:AnyObject] {
                            print("HEY 22222")
                            if let title = name["title"] as? String, let first = name["first"] as? String, let last = name["last"] as? String {
                                if let photo = imageURL["large"] as? String {
                                    let nameObj = Name(title: title, first: first, last: last)
                                    let newUser = User(name: nameObj, email: mail, phone: phone, imageURL: photo)
                                    completionHandler(user: newUser)
                                }
                            }
                        }
                    }
                    
                    
                }
                catch {
                    print(error)
                }
                
            }
            completionHandler(user: nil)
        }
        task.resume()
    }
}