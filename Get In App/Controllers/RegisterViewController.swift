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
    
    enum LoginError: Error {
        case incompleForm
        case invalidEmail
        case incorrectPasswordLength
        case incorrectUserLengt
    }
    
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
        do{
           try logIn()
            usernameText.endEditing(true)
            userText = usernameText.text ?? ""
            let item = Item(userRegister: userText)
            items.append(item)
            performSegue(withIdentifier: "goToData", sender: self)
            usernameText.text = ""
            emailText.text = ""
            passwordText.text = ""
        }catch LoginError.incompleForm {
            Alert.showBasic(title: "Incomplete form", message: "Please complete the form", vc: self)
        }catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password Too Short", message: "Password must have eight characters minimum", vc: self)
        }catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid email", message: "Please introduce a valid email format", vc: self)
        }catch LoginError.incorrectUserLengt {
            Alert.showBasic(title: "Invalid User", message: "User name is too short", vc: self)
        }catch{
            Alert.showBasic(title: "Error trying to save data", message: "Try again mate", vc: self)
        }
       

        
        emailText.endEditing(true)
        eText = emailText.text ?? ""
        
        passwordText.endEditing(true)
        passText = passwordText.text ?? ""
        
           
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToData" {
            let destinationVC = segue.destination as! UserTableViewController
            destinationVC.registerViewController = self

        }
    }
    
    func logIn() throws {
        
        eText = emailText.text ?? ""
        passText = passwordText.text ?? ""
        userText = usernameText.text ?? ""
        
        
        if eText.isEmpty || passText.isEmpty {
            throw LoginError.incompleForm
        }
        
        if !eText.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if passText.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
        if userText.count < 8 {
            throw LoginError.incorrectUserLengt
        }
    }
}
