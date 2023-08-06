//
//  ViewController.swift
//  AboutMyApp
//
//  Created by Михаил Ю. Гоженко on 06.08.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userName = "Test"
    let password = "123"
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotUserNameButton.contentHorizontalAlignment = .left
        forgotPasswordButton.contentHorizontalAlignment = .right
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
 
    
    // MARK: IBAction
    @IBAction func forgotUserNameTap() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName) 😉")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password) 😉")
    }
    
    @IBAction func logInButtonTap() {
        let title = "Invalid login or password"
        let message = "Please, enter correct login and password"
        
        
        guard let inputUserName = userNameTextField.text,
              !inputUserName.isEmpty else {
            showAlert(withTitle: title, andMessage: message)
            return
        }
        guard let inputPassword = passwordTextField.text,
              !inputPassword.isEmpty else {
            showAlert(withTitle: title, andMessage: message)
            return
        }
        
        let userNamePattern = "^[a-zA-Z]{3,10}$"
        let isUserNameValid = NSPredicate(format: "SELF MATCHES %@", userNamePattern)
            .evaluate(with: inputUserName)
        
        if !isUserNameValid {
            showAlert(withTitle: "Incorrect format", andMessage: "Please, enter correct your login")
            return
        }
        
        if userNameTextField.text == userName && passwordTextField.text == password {
            
            
            //showAlert(withTitle: "Yeeeeehaaa", andMessage: "good job")
        }
    }
    // MARK: override func
    
    
    
    // MARK: private func
    private func showAlert(withTitle title: String, andMessage message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

