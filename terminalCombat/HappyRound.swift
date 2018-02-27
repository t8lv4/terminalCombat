//
//  HappyRound.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//

import Foundation

//enhance strength of the player
//randomly, one round only
class HappyRound {
    //if true, there's a new weapon (or cure) during this round
    func randomWeapon() -> Bool {
        let diceRoll = Int(arc4random_uniform(100) + 1)
        var bool = Bool()
        //20% chance to get a special weapon
        if (diceRoll > 40) && (diceRoll < 60) {
            bool = true
        } else {
            bool = false
        }
        return bool
    }
    
    //print if there's a random weapon this round
    func printNews() {
        print("\ngreat news !"
            + "\nWOAW, the Wizard Of All Wizards sents you a special gift"
            + "\n(this round only though)."
            + "\nyou've just DOUBLED your strength !\n")
    }
    
    //if there's a random weapon this round, call to set happyWeapon value to 1 and call to print the good news
    func randomWeaponProcess() {
        if (randomWeapon() == true) {
            GlobalProperties.happyWeapon = 1
            printNews()
        }
    }
}
