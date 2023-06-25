//
//  File.swift
//  NavigationBar
//
//  Created by Артём Черныш on 25.06.23.
//

import Foundation
enum beerType: String {
    case light = "светлое"
    case dark = "темное"
}
enum beerFilter: String {
    case filltered = "фильтрованное"
    case unfiltered = "нефильтрованное"
}
struct Beer {
    var name: String
    var litre: Decimal
    var type: beerType
    var filter: beerFilter
    var cost: (Decimal,Decimal,Decimal)
    init(name: String, litre: Decimal, type: beerType, filter: beerFilter, cost: (Decimal, Decimal, Decimal)) {
        self.name = name
        self.litre = litre
        self.type = type
        self.filter = filter
        self.cost = cost
    }
}
