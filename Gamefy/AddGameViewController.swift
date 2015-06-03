//
//  AddGameViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-27.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import CoreData
class AddGameViewController: UIViewController,UIPickerViewDelegate {
    
    @IBOutlet weak var txtSpots: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    
    var selectedGameType : GameType? = GameType?()
  
    
    var games: NSArray = NSArray()
    @IBOutlet weak var txtGameName: UITextField!
    override func viewDidLoad() {
        getCurrentUser()
        super.viewDidLoad()
        games = getAllGamesTypes()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
    return 1
    }
    
    func getAllGamesTypes()-> NSArray { //Fetech result (executeFetchRequest) return an NSArray
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let empty: NSArray = NSArray()
        
        let fetchRequest = NSFetchRequest(entityName: "GameType")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
            return fetchResults
        }
        return empty
        
    }
    
    
    func getCurrentUser() -> NSManagedObject {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
          var currentU : NSManagedObject? = NSManagedObject?()
        //let empty: NSManagedObject = NSManagedObject()
        
        var s = "rahmo"
        
    //   let predicate = NSPredicate(format: "User.userName == %@", s)
      //  let allEntities: NSArray = getAllGames()
       var fetchRequest = NSFetchRequest(entityName: "User")
      //  fetchRequest.predicate = predicate
    
        if  let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject]{
        
        currentU = fetchResults.first
        }
            

        
        //
        //                let fetchRequest = NSFetchRequest(entityName: "Game")
        //
        //                // Execute the fetch request, and cast the results to an array of LogItem objects
        //                if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
        //                    return fetchResults[number]
        //                }
        // return empty
        return currentU!
        
    }
    
   
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 4
            
            //games.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return games[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
     selectedGameType = games[row] as? GameType
        
        println(selectedGameType)
          }
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
       
     
        var game : GameModel = GameModel()
        game.name = txtGameName.text
        
       // game.gametype = (selectedGameType! as? GameType)!
        game.spots = txtSpots.text.toInt()!
        game.location = txtLocation.text
        
        let gamesListTableViewController = segue.destinationViewController as! GamesListTableViewController
       // var txt = txtGameName.text
        gamesListTableViewController.save(game,selectedGameType: selectedGameType!)
    }


}
