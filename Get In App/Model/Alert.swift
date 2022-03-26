//
//  Alert.swift
//  Get In App
//
//  Created by Zacarias Puente on 26/03/2022.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: RegisterViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
