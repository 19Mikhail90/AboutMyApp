//
//  ViewController.swift
//  AboutMyApp
//
//  Created by Михаил Ю. Гоженко on 06.08.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: leterals
    
    let user = "Qaz"
    let password = "qwe"
    
    // MARK: IBOutlet
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    
    
    // MARK: override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotUserNameButton.contentHorizontalAlignment = .left
        forgotPasswordButton.contentHorizontalAlignment = .right
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user, passwordTF.text == password else {
            showAlert(withTitle: "Invalid login or password",
                      andMessage: "Please, enter correct login and password"
            )
            return false
        }
        logInButtonTap()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeText = userNameTF.text
    }
    
    // MARK: IBAction
    @IBAction func forgotUserNameTap() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(user) 😉")
    }
    
    @IBAction func forgotPasswordTap() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password) 😉")
    }
    
    @IBAction func logInButtonTap() {
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        self.userNameTF.text = ""
        self.passwordTF.text = ""
    }

    // MARK: private func
    private func showAlert(withTitle title: String, andMessage message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

