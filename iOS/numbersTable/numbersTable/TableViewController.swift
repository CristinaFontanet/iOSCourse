//
//  TableViewController.swift
//  numbersTable
//
//  Created by 1181432 on 28/1/16.
//  Copyright © 2016 FIB. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var rowIndexPathAux:Int!
    
    var records:[Record] = [
        Record(title: "Most piercings, single count (male)", description: "The most pierced man is Rolf Buchholz, from Dortmund, Germany, who had 453 piercings, including 158 around his lips, as of 05 August 2010. He has 16 in his right ear, 15 in his left ear, 25 in his eyebrows, 8 in his nose, 94 in and around his lips, 2 in his tongue, 8 in the rest of his body, 3 in his nipples, 4 in his navel and 278 in the genital area.", imageName: "most-piercings"),
        Record(title: "Fastest growing plant", description: "The world record for the fastest growing plant belongs to certain species of the 45 genera of bamboo, which have been found to grow at up to 91 cm (35 in) per day or at a rate of 0.00003 km/h (0.00002 mph).", imageName: "fastest-growing-plant"),
        Record(title: "Tallest mountain", description: "Mauna Kea (White Mountain) on the island of Hawaii, USA, is the world's tallest mountain. Measured from its submarine base in the Hawaiian Trough to its peak, it has a combined height of 10,205 m (33,480 ft) of which 4,205 m (13,796 ft) are above sea level.", imageName: "tallest-mountain"),
        Record(title: "Largest spider", description: "The world's largest known spider is a male goliath bird-eating spider (Theraphosa blondi) collected by members of the Pablo San Martin Expedition at Rio Cavro, Venezuela in April 1965. It had a record leg-span of 28 cm (11 in) - sufficient to cover a dinner plate. This species is found in the coastal rainforests of Surinam, Guyana and French Guiana, but isolated specimens have also been reported from Venezuela and Brazil.", imageName: "largest-spider"),
        Record(title: "Fastest internet connection (country)", description: "According to Cisco, South Korea has the best broadband service in the world, with an average download throughput of 33.5 megabits per second – nearly three times the speed of second-place Hong Kong – an average upload throughput of 17 megabits per second – more than twice that of Hong Kong, and has 100 percent broadband penetration.", imageName: "fastest-internet-country"),
        Record(title: "Heaviest birth - triplets (current)", description: "The heaviest triplets at birth (current) are Evan Patrick, Aiden Cole and Lilly Kathryn (all USA), who had a combined weight of 10.33 kg (22 lb 12.6 oz) and were born to Michelle Lee Wilson on 29 July 2003 at Englewood, Colorado, USA. ", imageName: "heaviest-birth"),
        Record(title: "Largest crocodile in captivity (living)", description: "Cassius, an Australian saltwater crocodile (Crocodylus porosus), is the largest crocodile in captivity at 5.48 m (17 ft 11.75 in). The Australian saltwater crocodile is the largest and most fearsome of today's species. Specimens can live for more than 100 years, can grow to 7 m (23 ft) and weigh more than 1 tonne (1.1 ton)!", imageName: "largest-crocodile"),
        Record(title: "Longest fur on a cat", description: "The longest fur on a cat is 25.68 cm (10.11 in) and belongs to Sophie Smith, owned by Jami Smith (USA), as measured in Oceanside, California, USA, on 09 November 2013.", imageName: "logenst-fur-cat"),
        Record(title: "Highest divorce rate", description: "According to the UN, the country with the highest divorce rate in the world is the Maldives with 10.97 divorces per 1,000 inhabitants per year. This is followed by the Belarus with 4.63 and the United States wih 4.34.", imageName: "highest-divorce-rate"),
        Record(title: "Longest ears on a dog - living", description: "The longest ears on a dog measured 31.1 cm (12.25 in) and 34.3 cm (13.5 in) for the left and right ears, respectively, on 8 June 2010. They belong to Harbor, a Black and Tan Coonhound, who is owned by Jennifer Wert of Colorado, USA. Harbor is a 7 year old Coonhound (b. July 2003) who weighs a healthy 40.51kg (89.2 pounds).", imageName: "longest-ears-dog"),
        Record(title: "Oldest person ever", description: "The greatest fully authenticated age to which any human has ever lived is 122 years 164 days by Jeanne Louise Calment (France). Born on 21 February 1875 to Nicolas (1837 - 1931) and Marguerite (neé Gilles 1838 - 1924), Jeanne died at a nursing home in Arles, southern France on 4 August 1997.", imageName: "oldest-person-ever")
        
    ]

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Guinness World Records"
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
        return records.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("recordCell", forIndexPath: indexPath) as? recordTableViewCell {
            cell.titleLabel.text = records[indexPath.row].title
            
            let nameImage:String = records[indexPath.row].imageName
            cell.recordImage.image = UIImage(named: nameImage)
                      return cell
        }

        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        rowIndexPathAux = indexPath.row
        performSegueWithIdentifier("showDetails", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        switch segueIdentifier {
        case "showDetails":
            let destination = segue.destinationViewController as! DetailViewController
            
            destination.whichRecord = records[rowIndexPathAux]
            
        default: break
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.view.frame.size.height/3.0
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
