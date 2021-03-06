//
//  SetUp.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
// 
//


//set up characters' names, life and strength points
class SetUp {
    
    init() {
        
        setName()
        setValue()
        
    }
    
    //set team members' names
    private func setName() {
        
        print("enter a unique name")
        if let name = readLine() {
            //check name uniqueness
            if GlobalProperties.nameInGame.contains(name) {
                print("please choose another name : "
                    + "\nthis name is already in use, your choice is not valid.\n")
                setName()
            } else {
                //append the nameInGame array
                GlobalProperties.nameInGame.append(name)
                //pass value to a buffer to set team members' names
                Buffer.bufferName = name
            }
        }
    }
    
    //set values for each characters' type
    private func setValue() {
        
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
        
      Buffer.bufferValue[0] = life
      Buffer.bufferValue[1] = strength
    }
}
