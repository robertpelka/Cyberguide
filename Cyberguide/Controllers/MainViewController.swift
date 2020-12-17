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
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    var advices: [Advice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: K.Cell.cellNibName, bundle: nil), forCellReuseIdentifier: K.Cell.cellIdentifier)
        loadAdvices()
    }
    
    func loadAdvices() {
        
        db.collection(K.Firestore.collectionName)
            .order(by: K.Firestore.votesField)
            .addSnapshotListener { (querySnapshot, error) in
                self.advices = []
                if let e = error {
                    print("There was an issue retrieving data from Firestore \(e)")
                }
                else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for document in snapshotDocuments {
                            let data = document.data()
                            if let text = data[K.Firestore.textField] as? String,
                               let votes = data[K.Firestore.votesField] as? Int {
                                let newAdvice = Advice(text: text, votes: votes)
                                self.advices.append(newAdvice)
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if let advice = adviceTextField.text {
            if advice != "" {
                db.collection(K.Firestore.collectionName).addDocument(data: [
                    K.Firestore.textField : advice.uppercased(),
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
    
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let advice = advices[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.cellIdentifier, for: indexPath) as! AdviceCell
        cell.adviceText.text = advice.text
        cell.votes.text = String(advice.votes)
        return cell
    }
    
}
