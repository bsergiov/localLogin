//
//  ProfileViewController.swift
//  localLogin
//
//  Created by BSergio on 19.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surNameLabel: UILabel!
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    // MARK: - Publick properties
    var name = ""
    var surname = ""
    var avatarString = ""
    var scills = [Scill]()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        surNameLabel.text = surname
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageAvatar.layer.cornerRadius = imageAvatar.frame.width / 2
        imageAvatar.clipsToBounds = true
        imageAvatar.image = UIImage(named: avatarString)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aboutVC = segue.destination as! AboutViewController
        aboutVC.avatarString = avatarString
        aboutVC.skils = scills
    }
    
    
}
