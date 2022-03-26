//
//  RegisterViewController.swift
//  Get In App
//
//  Created by Zacarias Puente on 24/03/2022.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {

    var items: [Item] = []
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var userText : String = ""
    var eText : String = ""
    var passText : String = ""
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameText.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         var content = cell.defaultContentConfiguration()
         content.text = items[indexPath.row].userRegister
         cell.contentConfiguration = content
         return cell
     }
    
    @IBAction func didTapSave(_ sender: UIButton) {
        
        usernameText.endEditing(true)
        userText = usernameText.text ?? ""
        let item = Item(userRegister: userText)
        items.append(item)
        
        emailText.endEditing(true)
        eText = emailText.text ?? ""
        
        passwordText.endEditing(true)
        passText = passwordText.text ?? ""
  
       performSegue(withIdentifier: "goToData", sender: self)
           
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToData" {
            let destinationVC = segue.destination as! UserTableViewController
            destinationVC.registerViewController = self

        }
    }
}
