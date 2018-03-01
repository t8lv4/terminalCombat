//
//  WizardSpell.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//add wizard's strength value to life points, call from chooseHealX()
class WizardSpell {
    
    func heal(wound: Int) -> Int{
        //if there's a special weapon this round
        if (GlobalProperties.happyWeapon == 1) {
            GlobalProperties.cureLife += 40
            //default
        } else {
            GlobalProperties.cureLife += 20
        }
        return GlobalProperties.cureLife
    }
}
