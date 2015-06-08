//
//  GameDetailsViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-27.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    @IBOutlet weak var txtName: UILabel!

    @IBOutlet weak var txtPhone: UILabel!
    @IBOutlet weak var txtAddress: UILabel!
    
    @IBOutlet weak var txtInterests: UILabel!
    
    @IBOutlet weak var txtGameSpots: UILabel!
    @IBOutlet weak var txtGamename: UILabel!
    @IBOutlet weak var txtGameLocation: UILabel!
    
    var name:String = String()
    var phone:String = String()
    var address:String = String()
    var Intrests:String = String()
    var gameName: String = String()
    var gameSpots: NSNumber = NSNumber()
    var gameLocation: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtGamename.text = "\(gameName) "
        txtGameLocation.text = "\(gameLocation) "
        // txtGameSpots.text = "\(gameSpots)"
       txtName.text = "\(name) "
        txtPhone.text = "\(phone) "
        txtAddress.text = "\(address) "
        
      //  txtnma
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
