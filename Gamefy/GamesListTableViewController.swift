//
//  GamesListTableViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-27.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import CoreData

class GamesListTableViewController: UITableViewController ,UISearchBarDelegate ,UISearchDisplayDelegate ,UITableViewDataSource , UITableViewDelegate ,UISearchResultsUpdating{
    
    //[String]()
    
    var normalGames :NSArray = NSArray()
    var FilteredGames: NSArray = NSArray()
    
    
    var resultSearchController = UISearchController()
    @IBOutlet var tblView: UITableView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.delegate = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
         self.tableView.reloadData()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        setupGameTypes()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        
      
         normalGames  = getAllGames()
        FilteredGames = getfilteredGames()

        
        
        ///This  part below to refrsh the list after adding "pull down to refresh control "
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("didRefreshCells"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
      
    }

    
    
    
    func didRefreshCells(){
    
    self.tableView.reloadData()
     
    self.refreshControl?.endRefreshing()
    }
    
//    @IBAction func RetrieveNewGame(segue:UIStoryboardSegue ){
//    
//    }
    
    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue)
    {
        let sourceViewController: AnyObject = sender.sourceViewController
        // Pull any data from the view controller which initiated the unwind segue.
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        
        
        
        
        FilteredGames = NSArray()
        
        
        
        
        //

        //
        
         let predicate = NSPredicate(format: "SELF.gametype.name CONTAINS[c] %@","Basketball")
        
        //searchController.searchBar.text
            FilteredGames = normalGames.filteredArrayUsingPredicate(predicate)
        
            
            self.tableView.reloadData()
        
        
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
//        let array = normalGames.filteredArrayUsingPredicate(searchPredicate)
//        FilteredGames = array as! [String]
     
    }
    @IBAction func save(Igame: GameModel,selectedGameType: GameType) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
//        var user : User = User()
        let entity =  NSEntityDescription.entityForName("Game", inManagedObjectContext:managedContext)
        let userEntity =  NSEntityDescription.entityForName("User", inManagedObjectContext:managedContext)
         let game = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        if let name = defaults.stringForKey("userNameKey")
        {
            
            println(name)
            let Pwd = defaults.stringForKey("userPwd")
        
         let fetchRequest = NSFetchRequest(entityName: "User")
           // var predicate = NSPredicate(format: "name = %@", "Claire")
        let userPredicate = NSPredicate(format: "userName = %@ && password = %@ ", name , Pwd!)
        fetchRequest.predicate = userPredicate
        
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
           
            for result in fetchResults as! [User] {
               game.setValue(result, forKey: "user") //here to set the user for the game

//                println(result)
//                println(result.valueForKey("userName")!)
//                println(result.valueForKey("password")!)
            }
       
        }
        
        }
        
        
       
        // Set all of the song attributes
        game.setValue(Igame.name, forKey: "name")
        game.setValue(Igame.location, forKey: "location")
           game.setValue(Igame.spots, forKey: "spots")
           game.setValue(selectedGameType, forKey: "gametype")
        
        // Save context
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
      
         //println(getAllGames())
       println(game)
    }
    
    func setupGameTypes(){
    
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        
        let fetchRequest = NSFetchRequest(entityName: "GameType")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
        //do nothing
           if (fetchResults.count == 0) && !(fetchResults.count > 3) {
        let entity =  NSEntityDescription.entityForName("GameType", inManagedObjectContext:managedContext)
        
        let gameSoccer = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        let gameTennis = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        let gameVolleyball = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        let gameBasketball = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
            
         gameSoccer.setValue("Soccer", forKey: "name")
         gameTennis.setValue("Tennis", forKey: "name")
         gameVolleyball.setValue("Volleyball", forKey: "name")
         gameBasketball.setValue("Basketball", forKey: "name")
            gameSoccer.setValue(1, forKey: "id")
            gameTennis.setValue(2, forKey: "id")
            gameVolleyball.setValue(3, forKey: "id")
            gameBasketball.setValue(4, forKey: "id")
        // Save context
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
            }
        }
        }
    

    
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
        if (self.resultSearchController.active) {
            //var resCount :Int = getfilteredGames().count
          var name =  self.FilteredGames[0].name
            return self.FilteredGames.count
        }
        else{
           // var resCount :Int = normalGame.count
            return self.normalGames.count
        }
     
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
    
    func getfilteredGames()-> NSArray { //Fetech result (executeFetchRequest) return an NSArray
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let empty: NSArray = NSArray()
       
        let fetchRequest = NSFetchRequest(entityName: "Game")
         let GemetypePredicate = NSPredicate(format:  "SELF.gametype.name CONTAINS[c] %@","Basketball")
        fetchRequest.predicate = GemetypePredicate
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
//        
//        var cell = self.tableView.dequeueReusableCellWithIdentifier("GameCell") as! customCell
        let cell : customCell = self.tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as! customCell //we refer to the cell
  
      
//            cell.textLabel?.text = tableData[indexPath.row]
//            
//            return cell
//        if (self.searchres.active) {
//        
//        }
//        else
//        {
//        
//        }
            let indexSelection: Int  = indexPath.row //to convert indexath to Int
            let game: NSManagedObject = getEntity(indexSelection)
            
            var spots = game.valueForKey("spots") as? NSNumber
            var location = game.valueForKey("location") as? String
            //var gametype =
            var user = game.valueForKey("user")?.valueForKey("userName") as? String

            var gameTitle = game.valueForKey("name") as? String
            // cell.textLabel!.text = game.valueForKey("name") as? String
            cell.txtTitle!.text = "Title: \(gameTitle!) "
            cell.txtLocation!.text = "\(location!) "
            //cell.txtLocation.text = game.valueForKey("name") as? String
             cell.txtUser!.text = "user: \(user!) "
            cell.txtspots!.text = "spots: \(spots!) "
            cell.txtGameType!.text = game.valueForKey("gametype")?.valueForKey("name") as? String
            
            
            // let feed: FeedModel = feeds[indexPath.row]
        
    
            return cell

        
        //self.tblView.dataSource
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 
        let indexSelection: Int  = indexPath.row //to convert indexath to Int
        let game: NSManagedObject = getEntity(indexSelection)
        
        
        var spots = game.valueForKey("spots") as? NSNumber
        var location = game.valueForKey("location") as? String
        var name = game.valueForKey("user")?.valueForKey("name") as? String
        var gameTitle = game.valueForKey("name") as? String
        var phone = game.valueForKey("user")?.valueForKey("phone") as? String
        var address = game.valueForKey("user")?.valueForKey("address") as? String

        
        var gameDetailsViewController : GameDetailsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("GamedetailedID") as! GameDetailsViewController
        
        gameDetailsViewController.gameLocation = location!
        gameDetailsViewController.gameName = gameTitle!
        gameDetailsViewController.gameSpots = spots!
        gameDetailsViewController.name = name!
        gameDetailsViewController.address = address!
        gameDetailsViewController.phone = phone!
        
        self.presentViewController(gameDetailsViewController, animated: true, completion: nil)
      //  self.tblView.reloadData()
        
     
        
    }
//    
//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }
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
