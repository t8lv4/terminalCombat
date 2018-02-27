//
//  Launch.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//

import Cocoa

//launch and relaunch the game
class Launch {
    //ask another game
    func playAgain() {
        print(">do you want to play again ? (y/n)")
        if let choice = readLine() {
            switch choice {
            //reset round counter, call play to relaunch the game
            case "y": utilities.shell("clear") ; GlobalProperties.roundCounter = 0 ; play()
            //stop the game
            case "n": utilities.shell("clear") ; print("fair enough. shutdown now.") ; exit(0)
            //invalid input
            default: utilities.shell("clear") ; print("i didn't get it") ; playAgain()
            }
        }
    }
    
    //player 0 and player 1 play one after another
    //while team member's life > 0
    func play() {
        print("let's get to it !")
        setUpTeams.setUpTeam0()
        setUpTeams.setUpTeam1()
        //print names, life and strength points of each team
        setUpTeams.summarizeSetUp()
        //while alive() is true, each player has its round
        while (report.alive(counter: GlobalProperties.roundCounter)) {
            round.team0FightOrHeal()
            round.team1FightOrHeal()
        }
        //call play again
        playAgain()
    }
}
