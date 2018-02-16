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

//a array of names used in the game, to check for name's uniqueness
//and to avoid space and return
var nameInGame = ["", " "]

//to temporarily store character's life and strength values during init() setUp
var bufferValue = [0, 0]
//to temporarily store character's name
var bufferName = [""]

//to store the name of the opponent chosen by the player
var opponent = String()
//to store life points after combat
var newLifePoints = Int()

//store wizard's name
var nameOfWizard = ["", ""]

//store names of the fighters
var team0FighterName = ["", "", ""]
var team1FighterName = ["", "", ""]



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
            //1. fighter
            case "1": useBuffer(life: 100, strength: 10)
            //2. giant
            case "2": useBuffer(life: 140, strength: 5)
            //3. dwarf
            case "3": useBuffer(life: 60, strength: 20)
            //4. wizard
            case "4": useBuffer(life: 80, strength: 10) ;
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
    
    //print name, life and strength points
    func summarize() {
        //don't print the dead !
        if !(self.life <= 0) {
            print("\(self.name): life = \(self.life), strength = \(self.strength)")
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
    + "\n"
    + "\n"
    + "\n>welcome to terminalCombat<"
    + "\n"
    + "\n")

/////////////////////
//
//MARK: set up
//
////////////////////

//create var to pass value at memberTeam[]'s instantiation
var name = bufferName[0]
var life = bufferValue[0]
var strength = bufferValue[1]

//create an array of team's members
var m00: teamMember? ; var m01: teamMember? ; var m02: teamMember?
var memberTeam0 = [m00, m01, m02]

var m10: teamMember? ; var m11: teamMember? ; var m12: teamMember?
var memberTeam1 = [m10, m11, m12]

//set team 0 up
print("\(playerName[0]) : let's set up your team")
for i in 0...2 {
    print("for member \(i + 1):")
    //instantiate setUp to launch the set up process
    let _ = setUp()
    //give name, life and strength temporary values
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    //instantiate team member
    memberTeam0[i] = teamMember(name: name, life: life, strength: strength)
    //create an array of wizard names
    if (memberTeam0[i]!.life == 80) {
        nameOfWizard[0] = memberTeam0[i]!.name
    }
}

//set team 1 up
print("\n\(playerName[1]) : let's set up your team")
for i in 0...2 {
    print("for member \(i + 1):")
    //instantiate setUp to launch the set up process
    let _ = setUp()
    
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    
    memberTeam1[i] = teamMember(name: name, life: life, strength: strength)
    
    if (memberTeam1[i]!.life == 80) {
        nameOfWizard[1] = memberTeam1[i]!.name
    }
}

print("\ngreat ! let's summarize\n")

//print each player's team (name, life and strength points)
for j in 0...1 {
    print("\(playerName[j]), here is your team :")
    for i in 0...2 {
        memberTeam0[i]!.summarize()
    }
    print("\n=================\n\n")
}

///////////////////////
//
//MARK: fight
//
//////////////////////

//print fighters values for team 0
func introducingFighters0() {
    print("fighters are :")
    //prints name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        //but don't print the wizard
        if (memberTeam0[i]!.name != nameOfWizard[0]) {
            memberTeam0[i]!.summarize()
            //create an array of fighter names
            team0FighterName[i] = memberTeam0[i]!.name
        }
    }
}

//print fighters values for team 1 (including the wizard !)
func introducingFighter1() {
    print("fighters are :")
    //prints name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        //but don't print the wizard -> you need this to create a coherent team1FighterName[]
        if (memberTeam1[i]!.name != nameOfWizard[1]) {
            memberTeam1[i]!.summarize()
            //create an array of fighter names
            team1FighterName[i] = memberTeam1[i]!.name
        } else {
            //print wizard name
            memberTeam1[i]!.summarize()
        }
    }
}

//player 0 choose a fighter
func chooseFighter0() {
    //call function to read fighters values
    introducingFighters0()
    
    print("choose your fighter (enter his/her name):")
    //read the input
    if let fighter = readLine() {
        //check if input is valid
        if (team0FighterName.contains(fighter)) {
            //parse the team names to find a match with the input value
            for i in 0...2 {
                if (memberTeam0[i]!.name == fighter) {
                    //pass strength points to the fight function
                    fightAgainstTeam1(hit: memberTeam0[i]!.strength)
                }
            }
        } else {
            //input name is invalid
            print("i didn't get it")
            chooseFighter0()
        }
    }
}

//teamMember0 fights teamMember1
func fightAgainstTeam1(hit: Int) {
    //call chooseOpponent
    chooseOpponent1()
    //parse the team members to match with opponent value and find the life points
    for i in 0...2 {
        if (memberTeam1[i]!.name == opponent) {
            //actually THIS is the battle field
            //substract strength points (the 'hit' value) from life points of the opponent
            memberTeam1[i]!.life -= hit
            //give the new life value to newLifePoints
            newLifePoints = memberTeam1[i]!.life
            //print("newLIfePoints are \(newLifePoints)")
            //give the right name to opponent
            opponent = memberTeam1[i]!.name
        }
    }
    reportTeam1(casualty: opponent, level: newLifePoints)
}

//print new life points of a team 1 member after combat
func reportTeam1(casualty: String, level: Int) {
    print("after combat, \(opponent) has \(level) life points")
}

//teamMember0[] choose an opponent
func chooseOpponent1() {
    print("choose the opponent : throw down the gauntlet ! (...by typing his/her name)")
    //call function to print fighters values
    introducingFighter1()
    
    //read input
    if let choice = readLine() {
        print("and the opponent is \(choice)")
        //check if input is valid
        if (team1FighterName.contains(choice)) {
            //parse the team members to find a match
            for i in 0...2 {
                //memberTeam1[i]!.life >= 0 : you don't want to fight the dead. it's a double check.
                if (memberTeam1[i]!.name == choice) && (memberTeam1[i]!.life >= 0) {
                    //give opponent the choice value (ie the name of the fighter)
                    opponent = choice
                    //print("and the opponent is \(opponent) !")
                }
            }
        }
    } else {
        //input is invalid
        print("i didn't get it"
            + "please try again")
        chooseOpponent1()
    }
}

func chooseHeal() {
    print("choose your team member (enter his/her name:")
    for i in 0...2 {
        if !(memberTeam0[i]!.life == 0){
            print("type \(i + 1) for ") ; memberTeam0[i]!.summarize()
        }
    }
}

//choose between a fight or a cure
func fightOrHeal() {
    print("\(playerName[0]), what do you want to do:"
        + "\ntype 1 to fight"
        + "\ntype 2 to heal a member of my team")
    if let choice = readLine() {
        switch choice {
        //fight
        case "1": chooseFighter0()
        //heal
        case "2": chooseHeal()
        default: print("i didn't get it")
            fightOrHeal()
        }
    }
}

print("let's fight !")
fightOrHeal()
