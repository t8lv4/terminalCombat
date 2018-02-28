//
//  Player.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//set up players' names
class Player {
    
    var nameOfPlayer: String?
    
    func getPlayerName() {
        print(">what's your name ?")
        if let name = readLine() {
            //check name uniqueness
            if GlobalProperties.nameInGame.contains(name) {
                print("your choice is not valid or this name is already in use"
                    + "\nplease choose another name")
                getPlayerName()
            } else {
                //set name
                nameOfPlayer = name
                
                //append arrays to further check name uniqueness
                GlobalProperties.playerName.append(name)
                GlobalProperties.nameInGame.append(name)
            }
        }
    }
}
