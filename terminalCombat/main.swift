//
//  main.swift
//  terminalCombat, a combat game for two teams of three fighters.
//      to be played on a terminal
//
//  Created by Morgan on 14/02/2018.
//  Copyright © 2018 Morgan. All rights reserved.
//

import Foundation

////////////////
//
//MARK: varaibles, functions, collections
//
////////////////

//a buffer of names, to check for name's uniqueness in the game
var buffer = ["", " "]

//array of players names
var playerName = [String]()



////////////////
//
//MARK: classes
//
////////////////

class Player {
    
    var nameOfPlayer: String?
    /*
    init() {
        self.getPlayerName()
    }
    */
    func getPlayerName() {
        print("what's your name ?")
        if let name = readLine() {
            if buffer.contains(name) {
                print("your choice is not valid or this name is already in use"
                    + "\nplease choose another name")
                getPlayerName()
            } else {
                nameOfPlayer = name
                playerName.append(name)
                buffer.append(name)
            }
        }
    }

}

class setUp {
    
}

class teamMember {
    
}


///////////////
//
//MARK: main
//
//////////////

//input player's names
var player1 = Player()
player1.getPlayerName()
var player2 = Player()
player2.getPlayerName()


print("\(playerName[0]), \(playerName[1])")

print("hello \(player1.nameOfPlayer!) and \(player2.nameOfPlayer!) !"
+ "\nwelcome to terminalCombat")







