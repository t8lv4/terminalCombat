//
//  TeamMember.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  Copyright © 2018 Morgan. All rights reserved.
//

import Foundation

//characters' name, life and strength
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
