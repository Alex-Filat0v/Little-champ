//
//  SignupController.swift
//  ZaDonat
//
//  Created by MacUniverse on 24.03.2023.
//

import UIKit

class SignupController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var LoginField: UITextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordView: UIView!
    
    
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
    
    @IBAction func SignupButtonClick(_ sender: UIButton) {
        if checkField.validField(loginView, LoginField),
           checkField.validField(passwordView, PasswordField)
        {
            if PasswordField.text == ConfirmPasswordField.text{
                
                service.createNewUser(ZaDonat.LoginField(email: LoginField.text!, password: PasswordField.text!)) { [ weak self] code in
                    switch code.code {
                    case 0:
                        print("0")
                    case 1:
                        print("1")
                        self?.service.confirmEmail()
                        let alert = UIAlertController(title: "Success", message: "Потдтвердите вашу почту", preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Log in", style: .default) { _ in
                            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "Login")
                            self?.navigationController?.pushViewController(vc, animated: true)
                        }
                        alert.addAction(okBtn)
                        self?.present(alert, animated: true)
                    default:
                        print("SS")
                    }
                }
            } else {
                print("passwords don't match")
            }
        }
    }
    
}
