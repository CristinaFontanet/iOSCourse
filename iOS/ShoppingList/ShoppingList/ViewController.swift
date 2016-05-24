//
//  ViewController.swift
//  ShoppingList
//
//  Created by 1181432 on 3/2/16.
//  Copyright © 2016 Fib. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectsContext = appDelegate.managedObjectContext
    
        let fetchProductRequest = NSFetchRequest(entityName: "Product")
        do {
            products = try managedObjectsContext.executeFetchRequest(fetchProductRequest) as! [Product]
        }
        catch {
            print(error)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addProduct(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Product", message: "Add a new product", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action:UIAlertAction) -> Void in
                let textField = alert.textFields!.first
                self.saveProduct(textField!.text!)
                let indexPath = NSIndexPath(forRow: self.products.count-1, inSection: 0)
                self.shoppingListTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action: UIAlertAction) -> Void in }
        
        alert.addTextFieldWithConfigurationHandler {        //x afegir el textField
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func saveProduct(text: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectsContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Product", inManagedObjectContext: managedObjectsContext) //descripció d'entitat, no instacia!!
        let product = Product(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectsContext )
        product.name = text
        self.products.append(product)
        appDelegate.saveContext()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        cell!.textLabel!.text = products[indexPath.row].name
        
        return cell!
    }
}

