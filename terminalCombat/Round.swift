//
//  Round.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//
//



//combat and heal rounds for each team
class Round {
    
    ////////////////////////
    //
    //MARK: round team 0
    //
    ///////////////////////
    
    //print fighter's values for team 1 (including the wizard !), call from chooseOpponent1()
    private func introducingOpponent1() {
        //print name, life and strength of the living (ie life > 0)
        for i in 0...2 {
            memberTeam1[i]!.summarize()
        }
    }
    
    //teamMember0[] choose an opponent, call from fightAgainstTeam1()
    private func chooseOpponent1() {
        
        print("choose the opponent : throw down the gauntlet ! (...by typing his•her name)")
        //call private function to print fighters values
        introducingOpponent1()
        
        //read input
        if let choice = readLine() {
            //check input string validity
            if (GlobalProperties.team1FighterName.contains(choice)) || (GlobalProperties.nameOfWizard.contains(choice)) {
                //scan the team members to find a match
                for i in 0...2 {
                    //check if the opponent is alive
                    if (memberTeam1[i]!.name == choice) && (memberTeam1[i]!.life > 0) {
                        //give opponent choice value (ie the name of the fighter)
                        GlobalProperties.opponent = choice
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
        } else {
            //input is invalid
            print("i didn't get it"
                + "\nplease try again")
            chooseOpponent1()
        }
           
    }
    
    //teamMember0 fights teamMember1, call from chooseFighter0()
    private func fightAgainstTeam1(hit: Int) {
        //call randomWeapon and check boolean return
        //true means there's a random weapon this round
        happyRound.randomWeaponProcess()
        
        //call chooseOpponent
        chooseOpponent1()
        
        //scan the team members to match with opponent value and find the life points
        for i in 0...2 {
            if (memberTeam1[i]!.name == GlobalProperties.opponent) {
                //actually THIS is the battle field
                //there's a special weapon : double the hit value
                if (GlobalProperties.happyWeapon == 1) {
                    //subtract strength points (the 'hit' value) from opponent's life points
                    memberTeam1[i]!.life -= (hit*2)
                    //give the new life value to newLifePoints
                    GlobalProperties.newLifePoints = memberTeam1[i]!.life
                //default behavior
                } else {
                    memberTeam1[i]!.life -= hit
                    GlobalProperties.newLifePoints = memberTeam1[i]!.life
                }
            }
        }
        //call to print new life values
        report.aftermath(casualty: GlobalProperties.opponent, level: GlobalProperties.newLifePoints)
    }
    
    //print fighters values for team 0, call from chooseFighter0()
    private func introducingFighters0() {
        
        print("your fighters are :")
        
        //prints name, life and strength of the living (ie life > 0)
        for i in 0...2 {
            //but don't print the wizard
            if !(GlobalProperties.nameOfWizard.contains(memberTeam0[i]!.name)) {
                memberTeam0[i]!.summarize()
            }
        }
    }
    
    //player 0 choose a fighter
    private func chooseFighter0() {
        //call function to read fighters values
        introducingFighters0()
        
        print("choose your fighter (enter his•her name):")
        //read the input
        if let fighter = readLine() {
            //check if input is valid && doesn't read a '\n'
            if (GlobalProperties.team0FighterName.contains(fighter)) && (fighter != "") {
                //scan the team names to find a match with the input value
                for i in 0...2 {
                    
                    if (memberTeam0[i]!.name == fighter) && (memberTeam0[i]!.life > 0) {
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
    private func chooseHeal0() {

        print("choose your team member (enter his•her name)")
        for i in 0...2 {
            //don't print the dead && don't print the wizard
            if !(memberTeam0[i]!.life <= 0) && (memberTeam0[i]!.name != GlobalProperties.nameOfWizard[0]) {
                memberTeam0[i]!.summarize()
            }
        }
        //read input
        if let choice = readLine() {
            //the wizard can't cure himself
            if GlobalProperties.nameOfWizard.contains(choice) {
                print("a wizard can't cure himself\n")
                chooseHeal0()
                //check if input is valid
            } else if GlobalProperties.team0FighterName.contains(choice) {
                //scan the members to find a match
                for i in 0...2 {
                    
                    if (choice == memberTeam0[i]!.name) {
                        //add wizard's strength to life points
                        GlobalProperties.cureLife = memberTeam0[i]!.life
                        memberTeam0[i]!.life = WizardSpell.heal(wound: GlobalProperties.cureLife)
                        //print new life value
                        print("\(memberTeam0[i]!.name) has now \(memberTeam0[i]!.life) life points\n")
                        //utilities.waitAndClearTty(delay: 2)
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
        
        print(">\(GlobalProperties.playerName[0]), what do you want to do:"
            + "\n>type 1 to fight"
            + "\n>type 2 to heal a member of your team")
        if let choice = readLine() {
            
            switch choice {
            //launch a combat turn
            case "1": //utilities.shell("clear") ;
            print("let's fight !\n") ; chooseFighter0()
            //heal
            case "2":
                //utilities.shell("clear")
                //if there's no wizard in the team, go fight
                if (GlobalProperties.nameOfWizard[0] == "") {
                    print("there's no wizard in your team. go fight !\n") ; chooseFighter0()
                    //if the wizard is dead, go fight
                } else if (GlobalProperties.wizardLife[0] <= 0) {
                    print("the wizard took the boat with the elves. RIP. now go fight !\n") ; chooseFighter0()
                    //else, go heal
                } else {
                    chooseHeal0()
                }
            //cheat code launch killAll()
            case "fukushima": //utilities.shell("clear") ;
            easterEgg.killAll(player: 0)
            //invalid input
            default: //utilities.shell("clear") ;
            print("i didn't get it")
            team0FightOrHeal()
            }
        }
    }
    
    //////////////////////////////////////
    //
    //MARK: round team 1
    //
    /////////////////////////////////////
    
    //print fighters values for team 1 (including the wizard !), call from chooseOpponent1()
    private func introducingOpponent0() {
        //prints name, life and strength of the living (ie life > 0)
        for i in 0...2 {
            memberTeam0[i]!.summarize()
        }
    }
    
    //teamMember0[] choose an opponent, call from fightAgainstTeam1()
    private func chooseOpponent0() {
        
        print("choose the opponent : throw down the gauntlet ! (...by typing his•her name)")
        //call function to print fighters values
        introducingOpponent0()
        
        //read input
        if let choice = readLine() {
            //check input string validity
            if (GlobalProperties.team0FighterName.contains(choice)) || (GlobalProperties.nameOfWizard.contains(choice)) {
                //scan the team members to find a match
                for i in 0...2 {
                    
                    if (memberTeam0[i]!.name == choice) && (memberTeam0[i]!.life > 0) {
                        //give opponent choice value (ie the name of the fighter)
                        GlobalProperties.opponent = choice
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
        } else {
            print("i didn't get it"
                + "\nplease try again")
            chooseOpponent0()
        }
    }
    
    //teamMember0 fights teamMember1, call from chooseFighter0()
    private func fightAgainstTeam0(hit: Int) {
        //call randomWeapon and check boolean return
        //true means there's a random weapon this round
        happyRound.randomWeaponProcess()
        
        //call chooseOpponent
        chooseOpponent0()
        
        //scan the team members to match with opponent value and find the life points
        for i in 0...2 {
            
            if (memberTeam0[i]!.name == GlobalProperties.opponent) {
                //actually THIS is the battle field !
                //if there's a random weapon this round : double hit value
                if (GlobalProperties.happyWeapon == 1) {
                    //subtract strength points (the 'hit' value) from life points of the opponent
                    memberTeam0[i]!.life -= (hit*2)
                    //give the new life value to newLifePoints
                    GlobalProperties.newLifePoints = memberTeam0[i]!.life
                //default behavior
                } else {
                    memberTeam0[i]!.life -= hit
                    GlobalProperties.newLifePoints = memberTeam0[i]!.life
                }
            }
        }
        //call to print new life values
        report.aftermath(casualty: GlobalProperties.opponent, level: GlobalProperties.newLifePoints)
    }
    
    //print fighters values for team 0, call from chooseFighter0()
    private func introducingFighters1() {
        
        print("your fighters are :")
        //prints name, life and strength of the living (ie life > 0)
        for i in 0...2 {
            //but don't print the wizard
            if !(GlobalProperties.nameOfWizard.contains(memberTeam1[i]!.name)) {
                memberTeam1[i]!.summarize()
            }
        }
    }
    
    //player 0 choose a fighter
    private func chooseFighter1() {
        //call function to read fighters values
        introducingFighters1()
        
        print("choose your fighter (enter his•her name):")
        //read the input
        if let fighter = readLine() {
            //check if input is valid && doesn't read a '\n'
            if (GlobalProperties.team1FighterName.contains(fighter)) && (fighter != "") {
                //scan the team names to find a match with the input value
                for i in 0...2 {
                    
                    if (memberTeam1[i]!.name == fighter) && (memberTeam1[i]!.life > 0) {
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
    private func chooseHeal1() {
        
        print("choose your team member (enter his•her name)")
        
        for i in 0...2 {
            //don't print the dead && don't print the wizard
            if !(memberTeam1[i]!.life <= 0) && (memberTeam1[i]!.name != GlobalProperties.nameOfWizard[1]) {
                memberTeam1[i]!.summarize()
            }
        }
        //read input
        if let choice = readLine() {
            //the wizard can't cure himself
            if GlobalProperties.nameOfWizard.contains(choice) {
                print("a wizard can't cure himself\n")
                chooseHeal1()
            //check if input is valid
            } else if GlobalProperties.team1FighterName.contains(choice){
                //scan the members to find a match
                for i in 0...2 {
                    
                    if (choice == memberTeam1[i]!.name) {
                        //add wizard's strength to life points
                        GlobalProperties.cureLife = memberTeam1[i]!.life
                        
                        memberTeam1[i]!.life = WizardSpell.heal(wound: GlobalProperties.cureLife)
                        
                        //print new life value
                        print("\(memberTeam1[i]!.name) has now \(memberTeam1[i]!.life) life points\n")
                        
                        //utilities.waitAndClearTty(delay: 2)
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
        
        print(">\(GlobalProperties.playerName[1]), what do you want to do:"
            + "\n>type 1 to fight"
            + "\n>type 2 to heal a member of your team")
        
        if let choice = readLine() {
            
            switch choice {
            //launch a combat turn
            case "1": //utilities.shell("clear") ;
            print("let's fight !\n") ; chooseFighter1()
            //heal
            case "2":
                //utilities.shell("clear")
                //if there's no wizard in the team, go fight
                if (GlobalProperties.nameOfWizard[1] == "") {
                    print("there's no wizard in your team. go fight !\n") ; chooseFighter1()
                    //if the wizard is dead, go fight
                } else if (GlobalProperties.wizardLife[1] <= 0) {
                    print("the wizard took the boat with the elves. RIP. now go fight !\n") ; chooseFighter1()
                    //else, go heal
                } else {
                    chooseHeal1()
                }
            case "fukushima": //utilities.shell("clear") ;
            easterEgg.killAll(player: 1)
            default: //utilities.shell("clear") ;
            print("i didn't get it")
            team1FightOrHeal()
            }
        }
    }
}
