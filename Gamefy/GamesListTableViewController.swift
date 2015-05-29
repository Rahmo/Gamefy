//
//  GamesListTableViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-27.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import CoreData

class GamesListTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        

        
        
        ///This  part below to refrsh the list after adding "pull down to refresh control "
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("didRefreshCells"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
      
    }

    func didRefreshCells(){
    
    self.tableView.reloadData()
     
    self.refreshControl?.endRefreshing()
    }
    
    @IBAction func RetrieveNewGame(segue:UIStoryboardSegue ){
    
    }
    
    @IBAction func save(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Game", inManagedObjectContext:managedContext)
        
        
        let game = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set all of the song attributes
        game.setValue(sender, forKey: "name")
        game.setValue("new album", forKey: "location")
        
        // Save context
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
      
         println(getAllGames())
     //   println(game)
    }
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var resCount :Int = getAllGames().count
        return resCount
    }
    
        func getAllGames()-> NSArray { //Fetech result (executeFetchRequest) return an NSArray
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
            
            let empty: NSArray = NSArray()
            
            let fetchRequest = NSFetchRequest(entityName: "Game")
            
            // Execute the fetch request, and cast the results to an array of LogItem objects
            if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
                return fetchResults
            }
            return empty
    
    }
    
            func getEntity(number: Int) -> NSManagedObject {
            
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let managedContext = appDelegate.managedObjectContext!
                //let empty: NSManagedObject = NSManagedObject()
                
                let allEntities: NSArray = getAllGames()
                let Reuested: NSManagedObject = allEntities[number] as! NSManagedObject
                return Reuested
                
             
//                
//                let fetchRequest = NSFetchRequest(entityName: "Game")
//                
//                // Execute the fetch request, and cast the results to an array of LogItem objects
//                if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
//                    return fetchResults[number]
//                }
               // return empty
   
    }
            
            
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as! UITableViewCell //we refer to the cell

        
       // let feed: FeedModel = feeds[indexPath.row]
        let indexSelection: Int  = indexPath.row //to convert indexath to Int
        let game: NSManagedObject = getEntity(indexSelection)
        
        cell.textLabel!.text = game.valueForKey("name") as? String
       
     
    
        return cell
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
