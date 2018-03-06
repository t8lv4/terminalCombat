//
//  Report.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//reports life levels, casualties, combat aftermath
class Report {
    
    //print life levels for each team, call from alive()
    //if a team life levels == 0, call playAgain()
    func lifeLevels() {
        
        print(">\(GlobalProperties.playerName[0]) : your team level of life is \(GlobalProperties.lifeTeam0.reduce(0, +))"
            + "\n>\(GlobalProperties.playerName[1]) : your team level of life is \(GlobalProperties.lifeTeam1.reduce(0, +))\n")
        //if life level points <= 0, declare a winner
        if (GlobalProperties.lifeTeam0.reduce(0, +) <= 0) {
            print("congrats \(player1.nameOfPlayer!) ! you win this game !\n")
            //prompt to relaunch the game
            launch.playAgain()
        } else if (GlobalProperties.lifeTeam1.reduce(0, +) <= 0) {
            print("congrats \(player0.nameOfPlayer!) ! you win this game !\n")
            launch.playAgain()
        }
    }
    
    //print new life points of opponent after combat, check for liveness
    //call from fightAgainstTeamX()
    func aftermath(casualty: String, level: Int) {
        //utilities.shell("clear")
        print("after this combat, \(casualty) has \(level) life points left\n")
        //check for liveness
        if (level <= 0) {
            print("\(casualty), you are so out of this game !\n")
        }
        //test sum of life points
        if (GlobalProperties.lifeTeam0.reduce(0, +) <= 0) || (GlobalProperties.lifeTeam1.reduce(0, +) <= 0) {
            lifeLevels()
        }
        //utilities.waitAndClearTty(delay: 3)
    }
    
    //return boolean to while loop : if test is false, end the game, call from play()
    func alive(counter: Int) -> Bool {
        var test = Bool()
        
        for i in 0...2 {
            //update level of life points values to index of each lifeTeam array
            GlobalProperties.lifeTeam0[i] = memberTeam0[i]!.life
            GlobalProperties.lifeTeam1[i] = memberTeam1[i]!.life
            
            //test sum of values in lifeTeam array
            if (GlobalProperties.lifeTeam0.reduce(0, +) <= 0) || (GlobalProperties.lifeTeam1.reduce(0, +) <= 0) {
                test = false
            } else {
                test = true
            }
        }
        
        GlobalProperties.roundCounter += 1
        print("round \(GlobalProperties.roundCounter)")
        lifeLevels()
        return test
    }
}
