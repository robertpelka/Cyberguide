//
//  MainViewController.swift
//  Cyberguide
//
//  Created by Robert Pelka on 10/12/2020.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var adviceTextField: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let advice = adviceTextField.text {
            db.collection(K.Firestore.collectionName).addDocument(data: [
                K.Firestore.adviceField : advice,
                K.Firestore.votesField: 0
            ]
            ) { (error) in
                if let e = error {
                    print("There was an issue saving data to Firestore, \(e)")
                }
                else {
                    DispatchQueue.main.async {
                        self.adviceTextField.text = ""
                    }
                }
            }
        }
    }
    
}
