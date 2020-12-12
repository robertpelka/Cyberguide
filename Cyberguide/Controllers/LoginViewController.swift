//
//  LoginViewController.swift
//  Cyberguide
//
//  Created by Robert Pelka on 10/12/2020.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextfield.layer.borderWidth = 2.0
        passwordTextfield.layer.borderWidth = 2.0
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    DispatchQueue.main.async {
                        let myAlert: UIAlertController = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                        let cancel = UIAlertAction(title: "OK", style: .default, handler: nil)
                        myAlert.addAction(cancel)
                        self.present(myAlert, animated: true, completion: nil)
                    }
                }
                else {
                    self.performSegue(withIdentifier: K.Segues.loginSegue, sender: self)
                }
            }
        }
    }
    
}
