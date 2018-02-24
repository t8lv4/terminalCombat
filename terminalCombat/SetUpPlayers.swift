//
//  SetUpPlayers.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  Copyright © 2018 Morgan. All rights reserved.
//

import Foundation

//set up players'names, print welcome
class SetUpPLayers {
    //set up players' names
    func setUpPlayersNames() {
        //let player0 = Player()
        player0.getPlayerName()
        
        //let player1 = Player()
        player1.getPlayerName()
        
        print(">hello \(player0.nameOfPlayer!) !"
            + "\n>hello \(player1.nameOfPlayer!) !")
        
        //call to wait before clearing tty's window
        utilities.waitAndClearTty(delay: time)
        
        print(">welcome to terminalCombat")
        utilities.waitAndClearTty(delay: time)
        
        //open readme.md @ github
        utilities.openRules()
    }
}

