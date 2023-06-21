//
//  SettingsViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func refreshButtonAction(_ sender: Any) {
        if refreshButton.titleLabel?.text! == "Новая смена" {
            refreshButton.setTitle("Обновленная смена", for: .normal)
        } else {
            refreshButton.setTitle("Новая смена", for: .normal)
        }
    }
    @IBAction func nullButtonAction(_ sender: Any) {
        print("Смена была обнулена")
    }
    
}
