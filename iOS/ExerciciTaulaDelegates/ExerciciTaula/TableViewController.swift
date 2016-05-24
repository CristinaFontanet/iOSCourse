//
//  TableViewController.swift
//  ExerciciTaula
//
//  Created by Miguel Berrocal Gómez on 28/01/16.
//  Copyright © 2016 HELM S.C.P. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ColorDelegate {
    
    var selectedIndexPath:NSIndexPath!
    
    var dataCells = [Int:CellData]()
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath)
        
        if let unwrap = userDefaults.objectForKey(String(indexPath.row)+"text") {
      //  if let unwrapped = dataCells[indexPath.row+1] {
           // cell.textLabel?.text = unwrapped.text
           // cell.backgroundColor = unwrapped.color
            cell.textLabel?.text = (unwrap as! String)
            cell.backgroundColor = UIColor(CIColor: CIColor(string: (userDefaults.objectForKey(String(indexPath.row)+"color") as! String) ) )
            
        }
        else {
            cell.textLabel?.text = String(indexPath.row+1)
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPath = indexPath
        performSegueWithIdentifier("editColorSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "editColorSegue" {
            let destination = segue.destinationViewController as! ColorsViewController
            destination.delegate = self
        }
    }

    func sendColorSelected(text:String, color:UIColor) {
      /*  if let unwrapped = dataCells[selectedIndexPath.row+1] {
            unwrapped.text = text
            unwrapped.color = color
             dataCells[selectedIndexPath.row+1] = unwrapped
         //   dataCells.updateValue(unwrapped, forKey: selectedIndexPath.row+1)
        }
        else {
            let newCellChange = CellData(text: text, color: color)
            dataCells[selectedIndexPath.row+1] = newCellChange
        }
        */
        userDefaults.setObject(text, forKey: String(selectedIndexPath.row)+"text")
        userDefaults.setObject(color.CIColor.stringRepresentation, forKey: String(selectedIndexPath.row)+"color")
        
        tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)

    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
