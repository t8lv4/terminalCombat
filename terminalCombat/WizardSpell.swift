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
        //call to check if there's a random weapon,
        //if yes : print the news and set the value to be added to life points
        happyRound.randomWeaponProcess()
        //if there's a special weapon this round
        if (GlobalProperties.happyWeapon == 1) {
            GlobalProperties.cureLife += 20
            //default
        } else {
            GlobalProperties.cureLife += 10
        }        
        return GlobalProperties.cureLife
    }
}
