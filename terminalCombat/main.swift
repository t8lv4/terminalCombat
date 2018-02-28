//
//  main.swift
//
//  terminalCombat, a combat game for two teams of three fighters.
//  to be played on a terminal
//
//  Created by Morgan on 14/02/2018.
//  
//

import Foundation
import Cocoa

//MARK: instantiations

//MARK: instantiate team members' arrays
//use optionals to create arrays before instantiation process
var m00: TeamMember? ; var m01: TeamMember? ; var m02: TeamMember?
var memberTeam0 = [m00, m01, m02]

var m10: TeamMember? ; var m11: TeamMember? ; var m12: TeamMember?
var memberTeam1 = [m10, m11, m12]

//MARK: instantiate utilities
let utilities = Utilities()

//MARK: instantiate 2 players
var player0 = Player()
var player1 = Player()

//MARK: set up players' names
let setUpPlayers = SetUpPLayers()

//MARK: reports
let report = Report()

//MARK: easter egg
let easterEgg = EasterEgg()

//MARK: special random weapon
let happyRound = HappyRound()

//MARK:Heal
let wizardSpell = WizardSpell()

//MARK: set up teams
let setUpTeams = SetUpTeams()

//MARK: round
let round = Round()

//MARK: game launcher
let launch = Launch()


//MARK: play
//get the name of the players
utilities.shell("clear")
print("when prompted, please enter players' names")
setUpPlayers.setUpPlayersNames()

//launch the game
launch.play()







