//
//  Report.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//

import Foundation

//reports life levels, casualties, combat aftermath
class Report {
    
    //print life levels for each team, call from alive()
    //if a team life levels == 0, call playAgain()
    func lifeLevels() {
        print(">\(playerName[0]) : your team level of life is \(lifeTeam0.reduce(0, +))"
            + "\n>\(playerName[1]) : your team level of life is \(lifeTeam1.reduce(0, +))\n")
        //if life level points <= 0, declare a winner
        if (lifeTeam0.reduce(0, +) == 0) {
            print("congrats \(player1.nameOfPlayer!) ! you win this game !\n")
            //prompt to relaunch the game
            launch.playAgain()
        } else if (lifeTeam1.reduce(0, +) == 0) {
            print("congrats \(player0.nameOfPlayer!) ! you win this game !\n")
            launch.playAgain()
        }
    }
    
    //print new life points of opponent after combat, check for liveness
    //call from fightAgainstTeamX()
    func aftermath(casualty: String, level: Int) {
        utilities.shell("clear")
        print("after this combat, \(opponent) has \(level) life points left\n")
        //check for liveness
        if (level <= 0) {
            print("\(opponent), you're out of this game !\n")
        }
        utilities.waitAndClearTty(delay: 3)
    }
    
    //return boolean to while loop : if test is false, end the game, call from play()
    func alive(counter: Int) -> Bool {
        var test = Bool()
        for i in 0...2 {
            //set level of life points values to index of each lifeTeam array
            lifeTeam0[i] = memberTeam0[i]!.life
            lifeTeam1[i] = memberTeam1[i]!.life
            //test sum of values in lifeTeam array
            if (lifeTeam0.reduce(0, +) == 0) || (lifeTeam1.reduce(0, +) == 0) {
                test = false
            } else {
                test = true
            }
        }
        roundCounter += 1
        print("round \(roundCounter)")
        lifeLevels()
        return test
    }
}
