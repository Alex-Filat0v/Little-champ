//
//  ViewController.swift
//  ZaDonat
//
//  Created by MacUniverse on 23.03.2023.
//

import UIKit
import SwiftUI
import FirebaseCore

class ViewController: UIViewController {
    
    var userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let userLogin = userDefault.object(forKey: "isLogin") as? Bool ?? false
        
        
    }

    
    @IBAction func loginPushButtonAction(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func regPushButtonAction(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Signup", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signup")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
