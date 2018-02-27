//
//  EasterEgg.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//a kill all, set life levels at 0
//another Konami code...
class EasterEgg {
    //set opponent life levels at 0, kill the game
    func killAll(player: Int) {
        print("an easter egg is found !"
            + "\nand it's a nasty one : THIS is a KILL ALL !\n")
        //if player 0 enter the cheat code
        if (player == 0) {
            //set team 1 life points to 0
            GlobalProperties.lifeTeam1 = [Int](repeating: 0, count: 3)
            //if player 1 enter the cheat code
        } else if (player == 1) {
            //set team 0 life points to 0
            GlobalProperties.lifeTeam0 = [Int](repeating: 0, count: 3)
        }
        //reset names
        for _ in GlobalProperties.nameInGame {
            GlobalProperties.nameInGame = [""]
        }
        Buffer.bufferName = [""]
        GlobalProperties.nameOfWizard = ["", "", "", "", "", ""]
        GlobalProperties.team0FighterName = ["", "", ""]
        GlobalProperties.team1FighterName = ["", "", ""]
        //call lifeLevels()
        report.lifeLevels()
    }
}
