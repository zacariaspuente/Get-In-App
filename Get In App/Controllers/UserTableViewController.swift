//
//  UserTableViewController.swift
//  Get In App
//
//  Created by Zacarias Puente on 25/03/2022.
//

import UIKit

class UserTableViewController: UIViewController{

    var registerViewController: RegisterViewController?

    var userData : String?
    
    var itemArray = [Item] ()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.delegate = registerViewController
        tableView.dataSource = registerViewController


    }
}
