//
//  Managment.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

class Managment: ObservableObject {
    @Published var coins = 0
    @Published var energy = 0
    @Published var keys = 0
    
    func getEnergy() {
        self.energy = UserDefaults.standard.integer(forKey: "energy")
        
    }
    
    func getKeys() {
        keys = UserDefaults.standard.integer(forKey: "keys")
    }
    
    func getCoins() {
        coins = UserDefaults.standard.integer(forKey: "coins")
    }
    
    func updateCoins() {
        UserDefaults.standard.setValue(coins, forKey: "coins")
    }
    
    func updateEnergy() {
        UserDefaults.standard.setValue(energy, forKey: "energy")
    }
    
    func decreaseEnergy() {
        if energy != 0 {
            energy -= 1
        }
        updateEnergy()
    }
}
