//
//  RegisterUserViewController.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var btnTennis: UIButton!
    @IBOutlet weak var btnSoccer: UIButton!
    @IBOutlet weak var btnVball: UIButton!
    @IBOutlet weak var btnBasketball : UIButton!
    
    @IBOutlet weak var btnSubmit: UIButton!
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
        
        var currentbuttons = radioButtonController.selectedButtons()
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
