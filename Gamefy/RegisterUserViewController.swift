//
//  RegisterUserViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var btnTennis: UIButton!
    @IBOutlet weak var btnSoccer: UIButton!
    @IBOutlet weak var btnVball: UIButton!
    @IBOutlet weak var btnBasketball : UIButton!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    var radioButtonController = SSRadioButtonsController()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    
        
          radioButtonController.setButtonsArray([btnTennis!,btnSoccer!,btnVball!,btnBasketball!])
        //        var currentButton = radioButtonController.selectedButton()
        //        var currentButton = radioButtonController.selectedButton()
        //        var currentbuttons = radioButtonController.selectedButtons()
        //
    
    }

    @IBAction func SubmitPressed(sender: AnyObject) {
        
    
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
//    {
//        textField.resignFirstResponder()
//        return true;
//    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //         Get the new view controller using segue.destinationViewController.
        //         Pass the selected object to the new view controller.
        var currentbuttons = radioButtonController.selectedButtons()
        var interests = radioButtonController.getValOfinterests(currentbuttons!)
        
        
        var user: UserModel = UserModel()
        user.name = txtFullName.text
        user.userName = txtUserName.text
        user.password = txtPassword.text
        user.address = txtAddress.text
        user.phone = txtPhone.text
       
        
        let loginViewController = segue.destinationViewController as! LoginViewController
       // var txt = txtGameName.text
       loginViewController.save(user)
    }

}
