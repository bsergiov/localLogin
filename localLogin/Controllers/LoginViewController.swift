//
//  LoginViewController.swift
//  localLogin
//
//  Created by Сергей Бровко on 15.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Private properties
    let password = "HappyNewYear"
    let username = "student"
    
    // MARK: - Live Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        if let touch = touches.first {
            view.endEditing(true)
        }
    }
    
    
    // MARK: - IB Action
    
    @IBAction func forgotAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Forgot Password?" {
            showAllert(title: "Password", message: "Correct passsword \"\(password)\" 😉")
        }else {
            showAllert(title: "Username", message: "Correct username \"\(username)\" 😉")
        }
    }
     
    @IBAction func passwordAction() {
        validateToWelcome()
    }
    
    @IBAction func logInAction(_ sender: UIButton) {
        validateToWelcome()
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue){
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private methods
    
    private func validateToWelcome(){
        if loginTextField.text != username, passwordTextField.text != password{
            showAllert(title: "Data",
                       message: "Correct passsword \"\(password)\" Correct username \"\(username)\" 😉")
        }else {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WelcomViewController") as! WelcomViewController
            guard let userPost = loginTextField.text else { return }
            vc.username = userPost
            present(vc, animated: true, completion: nil)
        }
    }
    
    private func showAllert(title: String, message: String) {
        let allert = UIAlertController(title: "Incorrect \(title)",
                                       message: message,
                                       preferredStyle: .alert)
        
        allert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(allert, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        
        return true
    }
}
