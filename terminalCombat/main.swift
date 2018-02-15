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
//MARK: global variables, functions, collections
//
////////////////

//array of players names
var playerName = [String]()

//a buffer of names used in the game, to check for name's uniqueness
//and to avoid space and return
var nameInGame = ["", " "]

//to temporarily store character's life and strength values during init() setUp
var bufferValue = [0, 0]
//to temporarily store character's name
var bufferName = [""]




////////////////
//
//MARK: classes
//
////////////////

class Player {
    
    var nameOfPlayer: String?

    func getPlayerName() {
        print("what's your name ?")
        if let name = readLine() {
            if nameInGame.contains(name) {
                print("your choice is not valid or this name is already in use"
                    + "\nplease choose another name")
                getPlayerName()
            } else {
                nameOfPlayer = name
                playerName.append(name)
                nameInGame.append(name)
            }
        }
    }

}

//set the character's names, life and strength points up
class setUp {
    
    init() {
        setName()
        setValue()
    }
    
    func setName() {
        print("enter a unique name")
        if let name = readLine() {
            if nameInGame.contains(name) {
                print("please choose another name : "
                    + "\nthis name is already in use, your choice is not valid.\n")
                setName()
            } else {
                nameInGame.append(name)
                bufferName[0] = name
            }
        }
    }
    
    //set values for each character's type
    func setValue() {
        print("\nwhat's his/her type ?"
            + "\ntype 1 for a fighter (life = 100, strength = 10"
            + "\ntype 2 for a giant (life = 140, strength = 5?"
            + "\ntype 3 for a dwarf (life = 60, strength = 20?"
            + "\ntype 4 for a wizard (life = 80, (healing) strength = 10")
        if let type = readLine() {
            switch type {
                //fighter
            case "1": useBuffer(life: 100, strength: 10)
                //giant
            case "2": useBuffer(life: 140, strength: 5)
                //dwarf
            case "3": useBuffer(life: 60, strength: 20)
                //wizard
            case "4": useBuffer(life: 80, strength: 10)
            default: print("i didn't get it") ; return setValue()
            }
        }
    }
    
    //to temporary store values during each instantiation of setUp
    func useBuffer(life: Int, strength: Int) {
        bufferValue[0] = life
        bufferValue[1] = strength
    }
}

//class of characters in a team
class teamMember {
    
    var name: String
    var life: Int
    var strength: Int
    
    init(name: String, life: Int, strength: Int) {
        self.name = name
        self.life = life
        self.strength = strength
    }
    
    //print name, life ans strength points
    func summarize() {
        //don't print the dead !
        if !(self.life == 0) {
            print("\(self.name, self.life, self.strength)\n")
        }
    }
    
    
}


///////////////
//
//MARK: main
//
//////////////

//set up player's names
var player1 = Player()
player1.getPlayerName()

var player2 = Player()
player2.getPlayerName()


print("hello \(player1.nameOfPlayer!) and \(player2.nameOfPlayer!) !"
    + "\n>"
    + "\n>"
    + "\n>welcome to terminalCombat"
    + "\n>"
    + "\n>"
    + "\n")

//MARK: set up

//create var to pass value at memberTeam [] instantiation
var name = bufferName[0]
var life = bufferValue[0]
var strength = bufferValue[1]

//create an array of team's members
var m00: teamMember? ; var m01: teamMember? ; var m02: teamMember?
var memberTeam0 = [m00, m01, m02]

var m10: teamMember? ; var m11: teamMember? ; var m12: teamMember?
var memberTeam1 = [m10, m11, m12]

//set team 0 up
print("\(playerName[0]) : let's set up your team\n")
for i in 0...2 {
    print("for member \(i + 1):")
    let _ = setUp()
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    memberTeam0[i] = teamMember(name: name, life: life, strength: strength)
}

//set teams up
print("\n\(playerName[1]) : let's set up your team\n")
for i in 0...2 {
    print("for member \(i + 1):")
    let _ = setUp()
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    memberTeam1[i] = teamMember(name: name, life: life, strength: strength)
}

print("\ngreat ! let's summarize\n")

//print each player's team (name, life and strength points)
print("\(playerName[0]), here is your team :\n")
for i in 0...2 {
    memberTeam0[i]!.summarize()
}

print("\(playerName[1]), here is your team :\n")
for i in 0...2 {
    memberTeam1[i]!.summarize()
}



