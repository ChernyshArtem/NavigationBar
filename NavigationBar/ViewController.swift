//
//  ViewController.swift
//  NavigationBar
//
//  Created by Артём Черныш on 20.06.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barName: UILabel!
    @IBOutlet var alcoholButtons: [UIButton]!
    @IBOutlet var labelNames: [UILabel]!
    var beerArray:[String] = ["Пиво Солнышко","Пиво Арбузное","Пиво Этиловое","Пиво Метиловое","Пиво Лидское"]
    @IBAction func beerBuying(_ sender: UIButton) {
        let row = sender.tag / 10
        let column = sender.tag % 10
        var result: String
        switch column{
        case 0:
           result = "\(beerArray[row]) 0,33 л."
        case 1:
            result = "\(beerArray[row]) 0,5 л."
        default:
            result = "\(beerArray[row]) 1,0 л."
        }
        result = "Было куплено \(result)"
        print(result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<labelNames.count {
            labelNames[index].text = beerArray[index]
        }
        barName.text = "Кролпаб"
        
    }
    

}

