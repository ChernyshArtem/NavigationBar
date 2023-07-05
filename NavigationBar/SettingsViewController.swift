//
//  SettingsViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class SettingsViewController: UIViewController {
    var earning: Decimal = 0
    var allEarning: Decimal = 0
    @IBOutlet weak var allEarningLabel: UILabel!
    @IBOutlet weak var earningLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        earning = BarManager.managment.getEarningDay()
        allEarning = BarManager.managment.getEarningAll()
        refreshLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileViewController" ,
           let destination = segue.destination as? ProfileViewController {
            destination.name = "Артем Черныш"
            destination.parentController = self
        }
    }
    
    func refreshLabels() {
        earningLabel.text = "Выручка сегодня:\n\(earning) $"
        allEarningLabel.text = "Выручка всего:\n\(allEarning) $"
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        allEarning = allEarning + earning
        BarManager.managment.setEarningDay(newValue: 0)
        BarManager.managment.setEarningAll(newValue: allEarning)
        earning = 0
        refreshLabels()
    }
    
    @IBAction func nullButtonAction(_ sender: Any) {
        BarManager.managment.setEarningDay(newValue: 0)
        BarManager.managment.setEarningAll(newValue: 0)
        earning = 0
        allEarning = 0
        refreshLabels()
    }
}
