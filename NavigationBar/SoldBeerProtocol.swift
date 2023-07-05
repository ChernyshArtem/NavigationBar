//
//  SoldBeerProtocol.swift
//  NavigationBar
//
//  Created by Артём Черныш on 30.06.23.
//

import Foundation

protocol SoldBeer {
    func sendToBeerManager(costOfBeer: Decimal)
    func refreshBeerBar(indexOfBeer:Int, beer: Beer)
}
