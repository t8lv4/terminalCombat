//
//  Player.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  Copyright © 2018 Morgan. All rights reserved.
//

import Foundation

//set up players' names
class Player {
    
    var nameOfPlayer: String?
    
    func getPlayerName() {
        print(">what's your name ?")
        if let name = readLine() {
            //check name uniqueness
            if nameInGame.contains(name) {
                print("your choice is not valid or this name is already in use"
                    + "\nplease choose another name")
                getPlayerName()
            } else {
                //set name
                nameOfPlayer = name
                //append arrays to further check name uniqueness
                playerName.append(name)
                nameInGame.append(name)
            }
        }
    }
}
