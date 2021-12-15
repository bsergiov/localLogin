//
//  WelcomViewController.swift
//  localLogin
//
//  Created by Сергей Бровко on 15.12.2021.
//

import UIKit

class WelcomViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var logOutButton: UIButton!
    
    // MARK: - Public Property
    var username = ""
    
// MARK: - Live Cicle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let helloText = helloLabel.text {
            helloLabel.text = "\(helloText) \(username)"
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logOutButton.layer.cornerRadius = 10
    }
    
    // MARK: - IB Action
    @IBAction func logOutAction() {
    }
    
    

}
