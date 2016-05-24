//: Playground - noun: a place where people can play

import UIKit

var diccionari:[String:String] = ["patata":"La patata és tubercul","Sugus":"Xiclet que es pot empassar", "Jamon5J": "Obsequi que es dona al professor al acabar el curs"]

diccionari["Sugus"] = "L'oscar diu que xiclet xiclet no"

diccionari["patata"]


let urlString = "www.randomuser.me/api/"
let url = NSURL(string: urlString)!

let session = NSURLSession.sharedSession()
let request = NSMutableURLRequest(URL: url)

let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
    guard error == nil else {
        return
    }
    
    if let unwrappedData = data {
        
        var jsonDictionary = [String:AnyObject]()
        do {
            jsonDictionary = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: NSJSONReadingOptions()) as! [String:AnyObject]
            if let results = jsonDictionary["results"] as? [[String:AnyObject]] {
                let userData = results[0]
                if let email = userData["email"] as? String, let gender = userData["gender"] as? String {
                    print(email)
                }
            }
            
            
        }
        catch {
            print(error)
        }
        
        
    }
}
task.resume()
