//
//  RegisterViewController.swift
//  Cyberguide
//
//  Created by Robert Pelka on 10/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confrimTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextfield.layer.borderWidth = 2.0
        passwordTextfield.layer.borderWidth = 2.0
        confrimTextfield.layer.borderWidth = 2.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
