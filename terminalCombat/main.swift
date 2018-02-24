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
import Cocoa

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

//default value for wait(delay: UInt32) and waitAndClearTty(delay: UInt32)
let time: UInt32 = 1

//instantiate utilities
let utilities = Utilities()

//instantiate 2 players
var player0 = Player()
var player1 = Player()

//create arrays of teams' members
var m00: TeamMember? ; var m01: TeamMember? ; var m02: TeamMember?
var memberTeam0 = [m00, m01, m02]

var m10: TeamMember? ; var m11: TeamMember? ; var m12: TeamMember?
var memberTeam1 = [m10, m11, m12]


/////////////////////////////
//
//MARK: set up players' names
//
/////////////////////////////

let setUpPlayers = SetUpPLayers()


/////////////////////////////
//
//MARK: reports
//
////////////////////////////


let report = Report()

////////////////////////
//
//MARK: easter egg
//
///////////////////////

let easterEgg = EasterEgg()

/////////////////////////
//
//MARK: special random weapon
//
/////////////////////////

let happyRound = HappyRound()

//////////////////////////////
//
//MARK:Heal
//
////////////////////////////

let wizardSpell = WizardSpell()

///////////////////////////////
//
//MARK: set up teams
//
///////////////////////////////

let setUpTeams = SetUpTeams()

////////////////////////////
//
//MARK: round
//
//////////////////////////

let round = Round()

////////////////////////////////
//
//MARK: game launcher
//
///////////////////////////////

let launch = Launch()

//get the name of the players
print("when prompted, please enter players' names")
setUpPlayers.setUpPlayersNames()

//launch the game
launch.play()







