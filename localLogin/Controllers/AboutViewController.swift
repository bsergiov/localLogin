//
//  AboutViewController.swift
//  localLogin
//
//  Created by BSergio on 19.12.2021.
//

import UIKit

class AboutViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var tableviewAbout: UITableView!
    
    //MARK: - Public Properties
    var skils = [Scill]()
    var avatarString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewAbout.delegate = self
        tableviewAbout.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.image = UIImage(named: avatarString)
    }

}
//MARK: - TableView delegate and dataSource
extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        skils.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCastomCellTableViewCell", for: indexPath) as! AboutCastomCellTableViewCell
        cell.scillTitleLabel.text = skils[indexPath.row].title
        cell.scillDiscriptionLabel.text = skils[indexPath.row].description
        
        return cell
    }
    
    
}
