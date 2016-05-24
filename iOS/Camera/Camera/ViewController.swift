//
//  ViewController.swift
//  Camera
//
//  Created by 1181432 on 4/2/16.
//  Copyright © 2016 Fib. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {

    var newPicture:Bool!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIBarButtonItem!
    
    
  //  var applicationDocumentsDirectory = NSURL(string: <#T##String#>)
    var fileManager:NSFileManager!
    
    var fileURL:NSURL?
    let name = "lastPhoto"
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "FIB.Projecte" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPicture = false
  //      applicationDocumentsDirectory = NSURL(string: String)
        fileManager = NSFileManager.defaultManager()
        fileURL = applicationDocumentsDirectory.URLByAppendingPathComponent(name)
        print((fileURL?.path)!)
        if fileManager.fileExistsAtPath(fileURL!.path!) {
            let recoveredData = fileManager.contentsAtPath(fileURL!.path!)
            imageView.image = UIImage(data: recoveredData!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSheet(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Choose an image", message: "", preferredStyle: .ActionSheet) // 1
        let firstAction = UIAlertAction(title: "From camera", style: .Default) { (alert: UIAlertAction!) -> Void in
            self.cameraOptionSelected()
        } // 2
        
        let secondAction = UIAlertAction(title: "From file", style: .Default) { (alert: UIAlertAction!) -> Void in
            self.cameraRollOptionSelected()
        } // 3
        
        alert.addAction(firstAction) // 4
        alert.addAction(secondAction) // 5
        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = sender as? UIBarButtonItem
        }
        presentViewController(alert, animated: true, completion:nil) // 6
    }


    
    func cameraOptionSelected() {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
                
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
                newPicture = true
        }
    }
    
    func cameraRollOptionSelected() {
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newPicture = false
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType == kUTTypeImage as String {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            saveImageToDocuments(image)
            
            imageView.image = image
            
            if (newPicture == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
                
            } else if mediaType == kUTTypeMovie as String {
                // Code to support video here
            }
            
        }
        
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        if error != nil {
            let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    

    func saveImageToDocuments(image: UIImage) {
        let dataImag = UIImagePNGRepresentation(image)
        let fileURL = applicationDocumentsDirectory.URLByAppendingPathComponent(name)
        if let data = dataImag {
            data.writeToFile(fileURL.path!, atomically: true)
        }
        
    }
}

