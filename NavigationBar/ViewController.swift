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
        loadAlcoholArray()
    }
    
    func loadAlcoholArray () {
        for (index,alcoholButton) in alcoholButtons.enumerated() {
            alcoholButton.tag = index
            beerNames[index].font = UIFont.boldSystemFont(ofSize: 24.0)
            beerNames[index].text = beerArray[index].name
            beerLitres[index].text = "Остаток пива: \(beerArray[index].litre) л."
        }
    }

    @IBAction func openBeerDescription(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BeerDescriptionViewController") as? BeerDescriptionViewController{
            vc.parentController = self
            vc.selectedBeer = beerArray[sender.tag]
            vc.indexOfSelectedBeer = sender.tag
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController: SoldBeer {
    func refreshBeerBar(indexOfBeer: Int, beer: Beer) {
            beerArray[indexOfBeer] = beer
            beerNames[indexOfBeer].font = UIFont.boldSystemFont(ofSize: 24.0)
            beerNames[indexOfBeer].text = beerArray[indexOfBeer].name
            beerLitres[indexOfBeer].text = "Остаток пива: \(beerArray[indexOfBeer].litre) л."
    }
    func sendToBeerManager(costOfBeer: Decimal) {
        var earningDay: Decimal = BarManager.managment.getEarningDay()
        earningDay+=costOfBeer
        BarManager.managment.setEarningDay(newValue: earningDay)
    }
}
