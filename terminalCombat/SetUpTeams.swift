//
//  SetUpTeams.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//



//process to set up 2 teams of 3 members
//print teams values
class SetUpTeams {
    
    /////////////////////
    //
    //MARK: set up team 0
    //
    ////////////////////
    
    //give names and character's type to team 0's members
    func setUpTeam0() {
        
        print("\(GlobalProperties.playerName[0]) : let's set up your team")
        for i in 0...2 {
            print("for member \(i + 1):")
            //instantiate SetUp to launch the set up process
            let _ = SetUp()
            
            //instantiate teamMember
            memberTeam0[i] = TeamMember(name: Buffer.bufferName, life: Buffer.bufferValue[0], strength: Buffer.bufferValue[1])
            
            //set value of index 0 of nameOfWizard[] with wizard's name
            //set value of index 0 of wizardLife[] with wizard's life points
            if (memberTeam0[i]!.life == 80) {
                GlobalProperties.nameOfWizard[0] = memberTeam0[i]!.name
                GlobalProperties.wizardLife[0] = memberTeam0[i]!.life
            }
            //clear tty window
            //utilities.shell("clear")
        }
        
        //create an array of fighters' names
        for i in 0...2 {
            //avoid wizard
            if !(GlobalProperties.nameOfWizard[0] == memberTeam0[i]!.name) {
                //set values to index in array of team0 fighter names
                GlobalProperties.team0FighterName[i] = memberTeam0[i]!.name
            }
        }
    }
    
    /////////////////////
    //
    //MARK: set up team 1
    //
    ////////////////////
    
    //give names and type to team 1's members
    func setUpTeam1() {
        print("\(GlobalProperties.playerName[1]) : let's set up your team")
        for i in 0...2 {
            print("for member \(i + 1):")
            //instantiate setUp to launch the set up process
            let _ = SetUp()
            
            //instantiate teamMember
            memberTeam1[i] = TeamMember(name: Buffer.bufferName, life: Buffer.bufferValue[0], strength: Buffer.bufferValue[1])
            
            //set value of index 1 of nameOfWizard[]
            //set value of index 1 of wizardLife[] with wizard life points
            if (memberTeam1[i]!.life == 80) {
                GlobalProperties.nameOfWizard[1] = memberTeam1[i]!.name
                GlobalProperties.wizardLife[1] = memberTeam1[i]!.life
            }
            //clear tty window
            //utilities.shell("clear")
        }
        
        //set index values in array of fighters' names for team 1
        for i in 0...2 {
            //avoid wizard
            if !(GlobalProperties.nameOfWizard[1] == memberTeam1[i]!.name) {
                //give fighters' names values to index array of team0 fighter names
                GlobalProperties.team1FighterName[i] = memberTeam1[i]!.name
            }
        }
    }
    
    //print each player's team (name, life and strength points)
    func summarizeSetUp() {
        print("great ! let's summarize\n")
        
        print("\(GlobalProperties.playerName[0]), here is your team :")
        
        for i in 0...2 {
            memberTeam0[i]!.summarize()
        }
        
        print("\n==================\n")
        
        print("\(GlobalProperties.playerName[1]), here is your team :")
        for i in 0...2 {
            memberTeam1[i]!.summarize()
        }
        
        //utilities.waitAndClearTty(delay: 10)
    }
}


