//
//  LoginViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func backFromReg(segue:UIStoryboardSegue ){
        
    }
    
    @IBAction func LoginPressed(sender: AnyObject) {
        
       
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let empty: NSArray = NSArray()
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
         //   return fetchResults
            
            if (fetchResults.count > 0) {
                for result in fetchResults as! [User] {
                    if result.userName == txtUserName.text && result.password == txtPassword.text
                    {
                   self.messageLabel.text = "You have logged in " + result.userName;
               
                        let defaults = NSUserDefaults.standardUserDefaults()
                        defaults.setObject(result.userName, forKey: "userNameKey")//as a session to check later in protected veiws
                        defaults.setObject(result.password, forKey: "userPwd")
                   self.performSegueWithIdentifier("Log2app", sender: self)
                }
                    else {
                        self.messageLabel.text = "nothing "
                    }
                }
            }
        }
        
        
    }
    
    
    @IBAction func save(userModel: UserModel) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext:managedContext)
        
        
        let Uentity = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set all of the song attributes
        Uentity.setValue(userModel.name, forKey: "name")
        Uentity.setValue(userModel.address, forKey: "address")
        Uentity.setValue(userModel.userName, forKey: "userName")
        Uentity.setValue(userModel.password, forKey: "password")
        Uentity.setValue(userModel.phone, forKey: "phone")
        
        // Save context
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        
        //println(getAllGames())
        //   println(game)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
