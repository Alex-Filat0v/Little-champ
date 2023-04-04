//
//  LoginController.swift
//  ZaDonat
//
//  Created by MacUniverse on 24.03.2023.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    
    var tapGest: UITapGestureRecognizer?
    var checkField = CheckField.shared
    var service = Service.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
        
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @IBAction func loginPushButtonAction(_ sender: Any) {
        if checkField.validField(emailView, emailField),
           checkField.validField(passwordView, passwordField) {
            service.authInApp(LoginField(email: emailField.text!, password: passwordField.text!)) {[weak self] responce in
                switch responce {
                case.succes:
                    let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "Tabbar")
                    self?.navigationController?.pushViewController(vc, animated: true)
                case.error:
                    print("error")
                case.noVerify:
                    print("noVerify")
                }
            }
        }
    }
    
    func alertAction(_ header: String?, _ message: String?) -> UIAlertController {
        let alert = UIAlertController(title: header, message: message, preferredStyle: .alert)
        return alert
    }
    
}
