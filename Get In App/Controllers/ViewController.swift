//
//  ViewController.swift
//  Get In App
//
//  Created by Zacarias Puente on 23/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapRegister(_ sender: UIButton) {
     performSegue(withIdentifier: "goToForm", sender: self)
    }
 
    
    @IBAction func didTapGetIn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToRectum", sender: self)
    }
}

