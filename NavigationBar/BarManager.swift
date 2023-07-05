//
//  BarManager.swift
//  NavigationBar
//
//  Created by Артём Черныш on 30.06.23.
//

import Foundation

class BarManager {
    static var managment =  BarManager()
    private init () { }
    private var earningDay: Decimal?
    private var earningAll: Decimal?
    func getEarningDay() -> Decimal {
        if let earningDay{
            return earningDay
        } else {
            return 0
        }
    }
    func getEarningAll() -> Decimal {
        if let earningAll{
            return earningAll
        } else {
            return 0
        }
    }
    func setEarningDay(newValue: Decimal) {
        if newValue > 0{
            earningDay = newValue
        }
    }
    func setEarningAll(newValue: Decimal) {
        if newValue > 0{
            earningAll = newValue
        }
    }
}
