//
//  LoginViewController.swift
//  localLogin
//
//  Created by СV on 15.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Private properties
    
    let user = Model.getUser()
    let username = "student"
    let password = "HappyNewYear"
    
    // MARK: - Live Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.layer.cornerRadius = 10
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomViewController {
                welcomeVC.name = "\(user.person.name) \(user.person.surName)"
            }else if let navigationVC = viewController as? UINavigationController {
                
                if let profileVC = navigationVC.topViewController as? ProfileViewController {
                    profileVC.avatarString = user.person.avatar
                    profileVC.name = user.person.name
                    profileVC.surname = user.person.surName
                    profileVC.scills = user.person.scills
                }
            }
        }
    }
    
    // MARK: - IB Action
    
    @IBAction func forgotAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Forgot Password?" {
            showAllert(title: "Password", message: "Correct passsword \"\(user.pasword)\" 😉")
        }else {
            showAllert(title: "Username", message: "Correct username \"\(user.login)\" 😉")
        }
    }
    
    @IBAction func loginTaped() {
        if loginTextField.text != user.login || passwordTextField.text != user.pasword {
            showAllert(title: "Invalide login or password",
                       message: "Please, enter valide login or password",
                       textField: passwordTextField)
        }
    }
    
    
    @IBAction func unwind(for seque: UIStoryboardSegue){
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private methods
    
    private func showAllert(title: String, message: String, textField: UITextField? = nil) {
        let allert = UIAlertController(title: "Incorrect \(title)",
                                       message: message,
                                       preferredStyle: .alert)
        
        allert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            textField?.text = ""
        }))
        present(allert, animated: true, completion: nil)
    }
}

//MARK: - TextField Controllers
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginTaped()
            performSegue(withIdentifier: "welcomeSeque", sender: nil)
        }
        return true
    }
}


