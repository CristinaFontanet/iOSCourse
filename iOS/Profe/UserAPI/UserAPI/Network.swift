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
                dispatch_async(dispatch_get_main_queue(), { ////MAGIA NEGRRAAAAAAAAAAAA x tornar al thread principal
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
        
        let urlString = "https://www.randomuser.me/api"
        let url = NSURL(string: urlString)!
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            guard error == nil else {
                completionHandler(user: nil)
                return
            }
            if let unwrappedData = data {
                var jsonDictionary = [String:AnyObject]()
                do {
                    jsonDictionary = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: NSJSONReadingOptions()) as! [String:AnyObject]
                    let newUser = User(jsonDictionary: jsonDictionary)
                    completionHandler(user: newUser)
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