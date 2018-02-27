//
//  TeamMember.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//


//set up characters' names, life and strength points and summarize
class TeamMember {
    
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

//to temporarily store character's life and strength values during init() setUp
var bufferValue = [0, 0]
//to temporarily store character's name
var bufferName = [""]

//create var to pass value at memberTeam[]'s instantiation
var name = String()
var life = Int()
var strength = Int()

//create arrays of teams' members
var m00: TeamMember? ; var m01: TeamMember? ; var m02: TeamMember?
var memberTeam0 = [m00, m01, m02]

var m10: TeamMember? ; var m11: TeamMember? ; var m12: TeamMember?
var memberTeam1 = [m10, m11, m12]

