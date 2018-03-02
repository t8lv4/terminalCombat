//
//  SetUpPlayers.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//set up players'names, print welcome
class SetUpPLayers {
    
    //set up players' names
    func setUpPlayersNames() {
        
        //getPlayerName is a method of Player
        player0.getPlayerName()
        player1.getPlayerName()
        
        print(">hello \(player0.nameOfPlayer!) !"
            + "\n>hello \(player1.nameOfPlayer!) !")
        
        //call to wait before clearing tty's window
        //utilities.waitAndClearTty(delay: GlobalProperties.time)
        
        print(">welcome to terminalCombat")
        //utilities.waitAndClearTty(delay: GlobalProperties.time)
        
        //open readme.md @ github
        utilities.openRules()
    }
}

