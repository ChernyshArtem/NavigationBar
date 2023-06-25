//
//  ProfileViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameOfUser: UILabel!
    
    weak var parentController: SettingsViewController!
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Об авторе"
    }
    
    @IBAction func LinkAction(_ sender: Any) {
        let message = "https://t.me/ChernyshArtem"
       UIApplication.shared.open(URL(string: message)!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameOfUser.text = name
    }
}
