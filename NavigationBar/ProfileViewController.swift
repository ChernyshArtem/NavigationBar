//
//  ProfileViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func LinkAction(_ sender: Any) {
        let message = "https://t.me/ChernyshArtem"
       UIApplication.shared.open(URL(string: message)!)
    }


}
