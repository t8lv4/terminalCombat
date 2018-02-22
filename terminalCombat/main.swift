//
//  main.swift
//
//  terminalCombat, a combat game for two teams of three fighters.
//  to be played on a terminal
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

//array of player's names
var playerName = [String]()

//array of names used in the game, to check for name's uniqueness
//and to avoid space and return
var nameInGame = ["", " "]

//to temporarily store character's life and strength values during init() setUp
var bufferValue = [0, 0]
//to temporarily store character's name
var bufferName = [""]

//create var to pass value at memberTeam[]'s instantiation
var name = bufferName[0]
var life = bufferValue[0]
var strength = bufferValue[1]


//to store the name of the opponent chosen by the player
var opponent = String()
//to store life points after combat
var newLifePoints = Int()

//store wizards' names
var nameOfWizard = ["", "", "", "", "", ""]
//store wizards' life points
var wizardLife = [0, 0]

//store fighters' names
var team0FighterName = ["", "", ""]
var team1FighterName = ["", "", ""]

//store team members' life
var lifeTeam0 = [0, 0, 0]
var lifeTeam1 = [0, 0, 0]

//to test if there's a random weapon
var happyWeapon = Int()

//value of life points to be healed by the wizard
var cureLife = Int()

//a counter to go along team life's levels report
var roundCounter = 0

////////////////
//
//MARK: classes
//
////////////////

class Player {
    
    var nameOfPlayer: String?
    
    func getPlayerName() {
        print("when prompted, please enter players' names")
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

//set up characters' names, life and strength points
class setUp {
    
    init() {
        setName()
        setValue()
    }
    
    //set team members' names
    func setName() {
        print("enter a unique name")
        if let name = readLine() {
            //check name uniqueness
            if nameInGame.contains(name) {
                print("please choose another name : "
                    + "\nthis name is already in use, your choice is not valid.\n")
                setName()
            } else {
                //append the nameInGame array
                nameInGame.append(name)
                //pass value to a buffer to set team members' names
                bufferName[0] = name
            }
        }
    }
    
    //set values for each characters' type
    func setValue() {
        print(">what's his•her type ?"
            + "\n>type 1 for a fighter :: life = 100, strength = 10"
            + "\n>type 2 for a giant :: life = 140, strength = 5"
            + "\n>type 3 for a dwarf :: life = 60, strength = 20"
            + "\n>type 4 for a wizard :: life = 80, healing strength = 10")
        if let type = readLine() {
            switch type {
            //1. fighter
            case "1": useBuffer(life: 100, strength: 10)
            //2. giant
            case "2": useBuffer(life: 140, strength: 5)
            //3. dwarf
            case "3": useBuffer(life: 60, strength: 20)
            //4. wizard
            case "4": useBuffer(life: 80, strength: 10)
            default: print("i didn't get it") ; return setValue()
            }
        }
    }
    
    //temporarily store values during each instantiation of setUp
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
//MARK: set up player's names
//
//////////////

//set up players' names
var player0 = Player()
player0.getPlayerName()

var player1 = Player()
player1.getPlayerName()


print("\n>hello \(player0.nameOfPlayer!) !"
    + "\n>hello \(player1.nameOfPlayer!) !"
    + "\n"
    + "\n>welcome to terminalCombat"
    + "\n")

/////////////////////
//
//MARK: set up teams
//
////////////////////

//create an array of team's members
var m00: teamMember? ; var m01: teamMember? ; var m02: teamMember?
var memberTeam0 = [m00, m01, m02]

var m10: teamMember? ; var m11: teamMember? ; var m12: teamMember?
var memberTeam1 = [m10, m11, m12]

//set up team 0
print("\(playerName[0]) : let's set up your team")
for i in 0...2 {
    print("\nfor member \(i + 1):")
    //instantiate setUp to launch the set up process
    let _ = setUp()
    //give name, life and strength temporary values
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    //instantiate team member
    memberTeam0[i] = teamMember(name: name, life: life, strength: strength)
    //set value of index 0 of nameOfWizard[] with wizard's name
    //set value of index 0 of wizardLife[] with wizard's life points
    if (memberTeam0[i]!.life == 80) {
        nameOfWizard[0] = memberTeam0[i]!.name
        wizardLife[0] = memberTeam0[i]!.life
    }
}

//create an array of fighters' names
for i in 0...2 {
    //avoid wizard
    if !(nameOfWizard[0] == memberTeam0[i]!.name) {
        //set values to index in array of team0 fighter names
        team0FighterName[i] = memberTeam0[i]!.name
    }
}

//set up team 1
print("\n\(playerName[1]) : let's set up your team")
for i in 0...2 {
    print("for member \(i + 1):")
    //instantiate setUp to launch the set up process
    let _ = setUp()
    
    name = bufferName[0]
    life = bufferValue[0]
    strength = bufferValue[1]
    
    memberTeam1[i] = teamMember(name: name, life: life, strength: strength)
    //set value of index 1 of nameOfWizard[]
    //set value of index 1 of wizardLife[] with wizard life points
    if (memberTeam1[i]!.life == 80) {
        nameOfWizard[1] = memberTeam1[i]!.name
        wizardLife[1] = memberTeam1[i]!.life
    }
}


//set index values in array of fighters' names for team 1
for i in 0...2 {
    //avoid wizard
    if !(nameOfWizard[1] == memberTeam1[i]!.name) {
        //give fighters names values to index array of team0 fighter names
        team1FighterName[i] = memberTeam1[i]!.name
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

/////////////////////////////
//
//MARK: reports
//
////////////////////////////

//print life levels for each team, call from alive()
//if a team life levels == 0, call playAgain()
func lifeLevels() {
    print(">\(playerName[0]) : your team level of life is \(lifeTeam0.reduce(0, +))"
        + "\n>\(playerName[1]) : your team level of life is \(lifeTeam1.reduce(0, +))\n")
    //if life level points <= 0, declare a winner
    if (lifeTeam0.reduce(0, +) == 0) {
        print("congrats \(player1.nameOfPlayer!) ! you win this game !\n")
        playAgain()
    } else if (lifeTeam1.reduce(0, +) == 0) {
        print("congrats \(player0.nameOfPlayer!) ! you win this game !\n")
        playAgain()
    }
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
    print("\nround \(roundCounter)")
    lifeLevels()
    return test
}

//print new life points of opponent after combat, check for liveness
//call from fightAgainstTeamX()
func report(casualty: String, level: Int) {
    print("\nafter this combat, \(opponent) has \(level) life points left\n")
    //check for liveness
    if (level <= 0) {
        print("\(opponent), you're out of this game !\n")
    }
}

////////////////////////
//
//MARK: easter egg
//
///////////////////////

//set opponent life levels at 0, kill the game
func killAll(player: Int) {
    print("\nan easter egg is found !"
        + "\nand it's a nasty one : THIS is a KILL ALL !\n")
    //if player 0 enter the cheat code
    if (player == 0) {
        //set team 1 life points to 0
        lifeTeam1 = [Int](repeating: 0, count: 3)
    //if player 1 enter the cheat code
    } else if (player == 1) {
        //set team 0 life points to 0
        lifeTeam0 = [Int](repeating: 0, count: 3)
    }
    lifeLevels()
}


/////////////////////////
//
//MARK: special random weapon
//
/////////////////////////

//if true, there's a new weapon (or cure) during this round
func randomWeapon() -> Bool {
    let diceRoll = Int(arc4random_uniform(100) + 1)
    var bool = Bool()
    //20% chance to get a special weapon
    if (diceRoll > 40) && (diceRoll < 60) {
        bool = true
    } else {
        bool = false
    }
    return bool
}

//print if there's a random weapon this round
func printNews() {
    print("\ngreat news !"
        + "\nWOAW, the Wizard Of All Wizards sents you a special gift (this round only though)."
        + "\nyou've just DOUBLED your strength !\n")
}

//if there's a random weapon this round, call to set happyWeapon value to 1 and call to print the good news
func randomWeaponProcess() {
    if (randomWeapon() == true) {
        happyWeapon = 1
        printNews()
    }
}

////////////////////////
//
//MARK:Heal
//
///////////////////////

//add wizard's strength value to life points, call from chooseHealX()
func heal(wound: Int) -> Int{
    //if there's a special weapon this round
    if (happyWeapon == 1) {
        cureLife += 20
    //default
    } else {
        cureLife += 10
    }
    return cureLife
}


////////////////////////
//
//MARK: team 0 round
//
///////////////////////

//print fighter's values for team 1 (including the wizard !), call from chooseOpponent1()
func introducingOpponent1() {
    //print name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        memberTeam1[i]!.summarize()
    }
}

//teamMember0[] choose an opponent, call from fightAgainstTeam1()
func chooseOpponent1() {
    print("choose the opponent : throw down the gauntlet ! (...by typing his•her name)")
    //call function to print fighters values
    introducingOpponent1()
    
    //read input
    if let choice = readLine() {
        //scan the team members to find a match
        for i in 0...2 {
            if (memberTeam1[i]!.name == choice) && (memberTeam1[i]!.life > 0){
                //give opponent choice value (ie the name of the fighter)
                opponent = choice
            //you don't want to fight a dead, so now you actually *can't* fight a dead
            } else if (memberTeam1[i]!.name == choice) && (memberTeam1[i]!.life <= 0) {
                print("\nchill, \(memberTeam1[i]!.name) is already dead...\n")
                chooseOpponent1()
            }
        }
    } else {
        //input is invalid
        print("i didn't get it"
            + "\nplease try again")
        chooseOpponent1()
    }
}

//teamMember0 fights teamMember1, call from chooseFighter0()
func fightAgainstTeam1(hit: Int) {
    //call randomWeapon and check boolean return
    //true means there's a random weapon this round
    randomWeaponProcess()
    //call chooseOpponent
    chooseOpponent1()
    //scan the team members to match with opponent value and find the life points
    for i in 0...2 {
        if (memberTeam1[i]!.name == opponent) {
            //actually THIS is the battle field
            //there's a special weapon : double the hit value
            if (happyWeapon == 1) {
                //substract strength points (the 'hit' value) from opponent's life points
                memberTeam1[i]!.life -= (hit*2)
                //give the new life value to newLifePoints
                newLifePoints = memberTeam1[i]!.life
            //default behavior
            } else {
                memberTeam1[i]!.life -= hit
                newLifePoints = memberTeam1[i]!.life
            }
        }
    }
    //call to print new life values
    report(casualty: opponent, level: newLifePoints)
}

//print fighters values for team 0, call from chooseFighter0()
func introducingFighters0() {
    print("your fighters are :")
    //prints name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        //but don't print the wizard
        if !(nameOfWizard.contains(memberTeam0[i]!.name)) {
            memberTeam0[i]!.summarize()
        }
    }
}

//player 0 choose a fighter
func chooseFighter0() {
    //call function to read fighters values
    introducingFighters0()
    
    print("choose your fighter (enter his•her name):")
    //read the input
    if let fighter = readLine() {
        //check if input is valid && doesn't read a '\n'
        if (team0FighterName.contains(fighter)) && (fighter != ""){
            //scan the team names to find a match with the input value
            for i in 0...2 {
                if (memberTeam0[i]!.name == fighter) && (memberTeam0[i]!.life > 0){
                    //pass strength points to the fight function
                    fightAgainstTeam1(hit: memberTeam0[i]!.strength)
                    //if the fighter is dead, relaunch the choose fighter process
                } else if (memberTeam0[i]!.name == fighter) && (memberTeam0[i]!.life <= 0) {
                    print("we're not rebooting the walking dead here")
                    chooseFighter0()
                }
            }
        } else {
            //input name is invalid
            print("i didn't get it")
            chooseFighter0()
        }
    }
}

//add wizard's strength points to life points of a chosen fighter
func chooseHeal0() {
    //call to check if there's a random weapon,
    //if yes : print the news and set the value to be added to life points
    randomWeaponProcess()
    print("choose your team member (enter his•her name)")
    for i in 0...2 {
        //don't print the dead && don't print the wizard
        if !(memberTeam0[i]!.life <= 0) && (memberTeam0[i]!.name != nameOfWizard[0]) {
            memberTeam0[i]!.summarize()
        }
    }
    //read input
    if let choice = readLine() {
        //the wizard can't cure himself
        if nameOfWizard.contains(choice) {
            print("a wizard can't cure himself\n")
            chooseHeal0()
        //check if input is valid
        } else if team0FighterName.contains(choice){
            //scan the members to find a match
            for i in 0...2 {
                if (choice == memberTeam0[i]!.name) {
                    //add wizard's strength to life points
                    cureLife = memberTeam0[i]!.life
                    memberTeam0[i]!.life = heal(wound: cureLife)
                    //print new life value
                    print("\(memberTeam0[i]!.name) has now \(memberTeam0[i]!.life) life points\n")
                }
            }
        //invalid input, try again
        } else {
            print("i didn't get it, please try again")
            chooseHeal0()
        }
    }
}


//choose a fight or a cure
func team0FightOrHeal() {
    print(">\(playerName[0]), what do you want to do:"
        + "\n>type 1 to fight"
        + "\n>type 2 to heal a member of your team")
    if let choice = readLine() {
        switch choice {
        //launch a combat turn
        case "1": print("let's fight then !\n") ; chooseFighter0()
        //heal
        case "2":
            //if there's no wizard in the team, go fight
            if (nameOfWizard[0] == "") {
                print("there's no wizard in your team. go fight !\n") ; chooseFighter0()
            //if the wizard is dead, go fight
            } else if (wizardLife[0] <= 0) {
                print("the wizard took the boat with the elves. RIP. now go fight !\n") ; chooseFighter0()
            //else, go heal
            } else {
                chooseHeal0()
            }
        //cheat code launch killAll()
        case "fukushima": killAll(player: 0)
        //invalid input
        default: print("i didn't get it")
        team0FightOrHeal()
        }
    }
}

//////////////////////////////////////
//
//MARK: team 1 round
//
/////////////////////////////////////

//print fighters values for team 1 (including the wizard !), call from chooseOpponent1()
func introducingOpponent0() {
    //prints name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        memberTeam0[i]!.summarize()
    }
}

//teamMember0[] choose an opponent, call from fightAgainstTeam1()
func chooseOpponent0() {
    print("choose the opponent : throw down the gauntlet ! (...by typing his•her name)")
    //call function to print fighters values
    introducingOpponent0()
    
    //read input
    if let choice = readLine() {
        //scan the team members to find a match
        for i in 0...2 {
            if (memberTeam0[i]!.name == choice) && (memberTeam0[i]!.life > 0){
                //give opponent choice value (ie the name of the fighter)
                opponent = choice
            //you don't want to fight a dead, so now you actually *can't* fight a dead
            } else if (memberTeam0[i]!.name == choice) && (memberTeam0[i]!.life <= 0) {
                print("\nchill, \(memberTeam0[i]!.name) is already dead...\n")
                chooseOpponent0()
            }
        }
    //input is invalid
    } else {
        print("i didn't get it"
            + "\nplease try again")
        chooseOpponent0()
    }
}

//teamMember0 fights teamMember1, call from chooseFighter0()
func fightAgainstTeam0(hit: Int) {
    //call randomWeapon and check boolean return
    //true means there's a random weapon this round
    randomWeaponProcess()
    //call chooseOpponent
    chooseOpponent0()
    //scan the team members to match with opponent value and find the life points
    for i in 0...2 {
        if (memberTeam0[i]!.name == opponent) {
            //actually THIS is the battle field !
            //if there's a random weapon this round : double hit value
            if (happyWeapon == 1) {
                //subtract strength points (the 'hit' value) from life points of the opponent
                memberTeam0[i]!.life -= (hit*2)
                //give the new life value to newLifePoints
                newLifePoints = memberTeam0[i]!.life
            //default behavior
            } else {
                memberTeam0[i]!.life -= hit
                newLifePoints = memberTeam0[i]!.life
            }
        }
    }
    //call to print new life values
    report(casualty: opponent, level: newLifePoints)
}

//print fighters values for team 0, call from chooseFighter0()
func introducingFighters1() {
    print("your fighters are :")
    //prints name, life and strength of the living (ie life > 0)
    for i in 0...2 {
        //but don't print the wizard
        if !(nameOfWizard.contains(memberTeam1[i]!.name)) {
            memberTeam1[i]!.summarize()
        }
    }
}

//player 0 choose a fighter
func chooseFighter1() {
    //call function to read fighters values
    introducingFighters1()
    
    print("choose your fighter (enter his•her name):")
    //read the input
    if let fighter = readLine() {
        //check if input is valid && doesn't read a '\n'
        if (team1FighterName.contains(fighter)) && (fighter != ""){
            //scan the team names to find a match with the input value
            for i in 0...2 {
                if (memberTeam1[i]!.name == fighter) && (memberTeam1[i]!.life > 0){
                    //pass strength points to the fight function
                    fightAgainstTeam0(hit: memberTeam1[i]!.strength)
                    //if the fighter is dead, relaunch the choose fighter process
                } else if (memberTeam1[i]!.name == fighter) && (memberTeam1[i]!.life <= 0) {
                    print("we're not rebooting the walking dead here")
                    chooseFighter1()
                }
            }
        //input name is invalid
        } else {
            print("i didn't get it")
            chooseFighter1()
        }
    }
}

//add wizard's strength points to life points of a chosen fighter
func chooseHeal1() {
    //call to check if there's a random weapon,
    //if yes : print the news and set the value to be added to life points
    randomWeaponProcess()
    print("choose your team member (enter his•her name)")
    for i in 0...2 {
        //don't print the dead && don't print the wizard
        if !(memberTeam1[i]!.life <= 0) && (memberTeam1[i]!.name != nameOfWizard[1]) {
            memberTeam1[i]!.summarize()
        }
    }
    //read input
    if let choice = readLine() {
        //the wizard can't cure himself
        if nameOfWizard.contains(choice) {
            print("a wizard can't cure himself\n")
            chooseHeal1()
        //check if input is valid
        } else if team1FighterName.contains(choice){
            //scan the members to find a match
            for i in 0...2 {
                if (choice == memberTeam1[i]!.name) {
                    //add wizard's strength to life points
                    cureLife = memberTeam1[i]!.life
                    memberTeam1[i]!.life = heal(wound: cureLife)
                    //print new life value
                    print("\(memberTeam1[i]!.name) has now \(memberTeam1[i]!.life) life points\n")
                }
            }
        //input name is invalid
        } else {
            print("i didn't get it, please try again")
            chooseHeal1()
        }
    }
}

//choose a fight or a cure
func team1FightOrHeal() {
    print(">\(playerName[1]), what do you want to do:"
        + "\n>type 1 to fight"
        + "\n>type 2 to heal a member of your team")
    if let choice = readLine() {
        switch choice {
        //launch a combat turn
        case "1": print("let's fight then !\n") ; chooseFighter1()
        //heal
        case "2":
            //if there's no wizard in the team, go fight
            if (nameOfWizard[1] == "") {
                print("there's no wizard in your team. go fight !\n") ; chooseFighter1()
            //if the wizard is dead, go fight
            } else if (wizardLife[1] <= 0) {
                print("the wizard took the boat with the elves. RIP. now go fight !\n") ; chooseFighter1()
            //else, go heal
            } else {
                chooseHeal1()
            }
        case "fukushima": killAll(player: 1)
        default: print("i didn't get it")
        team1FightOrHeal()
        }
    }
}


////////////////////////////////
//
//MARK: game launcher
//
///////////////////////////////

//ask another game
func playAgain() {
    print(">do you want to play again ? (y/n)")
    if let choice = readLine() {
        switch choice {
        //reset round counter, call play to relaunch the game
        case "y": roundCounter = 0 ; play()
        //stop the game
        case "n": print("fair enough. shutdown now.") ; exit(0)
        //invalid input
        default: print("i didn't get it") ; playAgain()
        }
    }
}

//player 0 and player 1 play one after another
//while team member's life > 0
func play() {
    print("let's get to it !")
    //while alive() is true, each player has its round
    while (alive(counter: roundCounter)) {
        team0FightOrHeal()
        team1FightOrHeal()
    }
    //call play again
    playAgain()
}

//launch the game
play()







