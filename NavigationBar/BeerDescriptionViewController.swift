//
//  BeerDsecriptionViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 25.06.23.
//

import UIKit

class BeerDescriptionViewController: UIViewController {
    @IBOutlet weak var beerError: UILabel!
    @IBOutlet weak var beerLiter: UILabel!
    weak var parentController: ViewController!
    @IBOutlet weak var buyBeerButton: UIButton!
    var indexOfSelectedBeer: Int = 0
    @IBOutlet weak var costForOneBeerBottle: UILabel!
    @IBOutlet weak var litreSelectorSegment: UISegmentedControl!
    var selectedBeer: Beer = Beer(name: "", litre: 0, type: .dark, filter: .filltered, cost: (0, 0, 0))
    var costForBottle: Decimal = 0
    @IBOutlet weak var descriptionLabel: UILabel!
    var litreForBottle: Decimal = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingDataForView()
    }
    @IBAction func buyBeer(_ sender: Any) {
        if selectedBeer.litre - litreForBottle > 0{
            selectedBeer.litre =  selectedBeer.litre - litreForBottle
            beerLiter.text = "Остаток пива: \(selectedBeer.litre) л."
        } else {
            beerError.text = "Пива на складе не хватает"
            beerError.textColor = .red
            buyBeerButton.isEnabled = false
        }
       soldSomeBeer()
    }
    @IBAction func changeLitreSelectorSegmentAction(_ sender: Any) {
        costForOneBeerBottle.text = "Цена за бутылку "
        switch litreSelectorSegment.selectedSegmentIndex {
        
        case 0:
            litreForBottle = 0.45
            costForBottle = selectedBeer.cost.0
            costForOneBeerBottle.text = "\(costForOneBeerBottle.text!)0.45: \(costForBottle)$"
        case 1:
            litreForBottle = 0.70
            costForBottle = selectedBeer.cost.1
            costForOneBeerBottle.text = "\(costForOneBeerBottle.text!)0.70: \(costForBottle)$"
        case 2:
            litreForBottle = 1.4
            costForBottle = selectedBeer.cost.2
            costForOneBeerBottle.text = "\(costForOneBeerBottle.text!)1.4: \(costForBottle)$"
        default:
            return
        }
    }
    func loadingDataForView() {
        self.title = "\(selectedBeer.name)"
        beerError.text = "Пива на складе хватает"
        beerError.textColor = .green
        beerLiter.text = "Остаток пива: \(selectedBeer.litre) л."
        costForOneBeerBottle.text = "\(costForOneBeerBottle.text!) \(selectedBeer.cost.0)$"
        costForBottle = selectedBeer.cost.0
        litreForBottle = 0.45
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        descriptionLabel.text = "Описание: \(selectedBeer.type.rawValue), \(selectedBeer.filter.rawValue)"
    }
    func soldSomeBeer() {
        parentController.beerArray[indexOfSelectedBeer] = selectedBeer
        parentController.loadAlcoholArray()
        parentController.earnings = parentController.earnings + costForBottle
    }
}
