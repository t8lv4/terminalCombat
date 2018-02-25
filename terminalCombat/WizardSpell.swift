//
//  WizardSpell.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//

import Foundation

//add wizard's strength value to life points, call from chooseHealX()
class WizardSpell {
    
    func heal(wound: Int) -> Int{
        //if there's a special weapon this round
        if (happyWeapon == 1) {
            cureLife += 20
            //default
        } else {
            cureLife += 10
        }
        return cureLife
    }
}
