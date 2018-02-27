//
//  GlobalProperties.swift
//  terminalCombat
//
//  Created by Morgan on 27/02/2018.
//

//variables and arrays found all around
class GlobalProperties {
    //array of player's names
    static var playerName = [String]()
    
    //array of names used in the game, to check for name's uniqueness
    //and to avoid space and return
    static var nameInGame = ["", " "]
    
    //to store the name of the opponent chosen by the player
    static var opponent = String()
    //to store life points after combat
    static var newLifePoints = Int()
    
    //store wizards' names
    static var nameOfWizard = ["", "", "", "", "", ""]
    //store wizards' life points
    static var wizardLife = [0, 0]
    
    //store fighters' names
    static var team0FighterName = ["", "", ""]
    static var team1FighterName = ["", "", ""]
    
    //store team members' life
    static var lifeTeam0 = [0, 0, 0]
    static var lifeTeam1 = [0, 0, 0]
    
    //to test if there's a random weapon
    static var happyWeapon = Int()
    
    //value of life points to be healed by the wizard
    static var cureLife = Int()
    
    //a counter to go along team life's levels report
    static var roundCounter = 0
    
    //default value for wait(delay: UInt32) and waitAndClearTty(delay: UInt32)
    static let time: UInt32 = 1
    
}

//to temporarily store character's life and strength values during init() setUp
var bufferValue = [0, 0]
//to temporarily store character's name
var bufferName = [""]
