//
//  ViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var beerLitres: [UILabel]!
    @IBOutlet var beerNames: [UILabel]!
    @IBOutlet var alcoholButtons: [UIButton]!
    
    var earnings: Decimal = 0
    
    var beerArray:[Beer] = [
        Beer(name: "Heineken", litre: 100, type: .light, filter: .filltered, cost: (6,12,24)),
        Beer(name: "Guinness", litre: 90, type: .dark, filter: .unfiltered, cost: (8,16,32)),
        Beer(name: "Stella Artois", litre: 86, type: .light, filter: .filltered, cost: (7,14,28)),
        Beer(name: "Hoegaarden", litre: 15, type: .light, filter: .unfiltered, cost: (19,38,76)),
        Beer(name: "Corona", litre: 1000, type: .light, filter: .filltered, cost: (27,54,108)),
        Beer(name: "Newcastle Brown Ale", litre: 666, type: .dark, filter: .unfiltered, cost: (5,10,20)),
        Beer(name: "Erdinger", litre: 35, type: .light, filter: .unfiltered, cost: (67,134,268)),
        Beer(name: "Samuel Adams ", litre: 278, type: .light, filter: .filltered, cost: (53,106,212)),
        Beer(name: "Chimay Blue", litre: 99, type: .dark, filter: .unfiltered, cost: (59,118,236)),
        Beer(name: "Pilsner Urquell", litre: 44, type: .light, filter: .filltered, cost: (49,98,196)),
        Beer(name: "Trappistes Rochefort", litre: 108, type: .dark, filter: .unfiltered, cost: (23,46,92)),
        Beer(name: "Duvel", litre: 146.7, type: .light, filter: .filltered, cost: (95,190,380)),
        Beer(name: "Krombacher Pils", litre: 78.2, type: .light, filter: .filltered, cost: (35,70,140)),
        Beer(name: "Leffe Brune", litre: 13, type: .dark, filter: .unfiltered, cost: (25,50,100)),
        Beer(name: "Sierra Nevada Pale", litre: 5, type: .light, filter: .filltered, cost: (73,146,292))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadAlcoholArray()
        sendEarningToSettings()
    }
    func loadAlcoholArray () {
        for (index,alcoholButton) in alcoholButtons.enumerated() {
            alcoholButton.tag = index
            beerNames[index].font = UIFont.boldSystemFont(ofSize: 24.0)
            beerNames[index].text = beerArray[index].name
            beerLitres[index].text = "Остаток пива: \(beerArray[index].litre) л."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BeerDescriptionViewController,
           let destination = segue.destination as? BeerDescriptionViewController,
           let senderAsButton = sender as? UIButton
        {
            destination.parentController = self
            destination.selectedBeer = beerArray[senderAsButton.tag]
            destination.indexOfSelectedBeer = senderAsButton.tag
        }
    }
    
    func sendEarningToSettings() {
        let controllers = tabBarController?.viewControllers
        let moreVC = controllers?.first { $0 is SettingsViewController } as! SettingsViewController
        moreVC.earning = earnings
        moreVC.menuController = self
    }
}

