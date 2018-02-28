//
//  Utilities.swift
//  terminalCombat
//
//  Created by Morgan on 24/02/2018.
//  
//

import Cocoa

//open rules, write command to bash, delay next instruction
class Utilities {
    
    //prefered web browser open README.md @ github
    func openRules() {
        if let url = URL(string: "https://github.com/t8lv4/terminalCombat/blob/master/README.md") {
            NSWorkspace.shared.open(url)
            print("your web browser should have opened the rules by now."
                + "\nif not, please copy and paste this url :"
                + "\nhttps://tinyurl.com/y9g23tcg\n"
                + "\nonce you've done with the rules...\n")
        }
    }
    
    //write command to tty
    func shell(_ args: String...) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
    }
    
    //delay next instruction in the main thread
    func wait(delay: UInt32) {
        sleep(delay)
    }
    
    //delay clearing of the tty window
    func waitAndClearTty(delay: UInt32) {
        sleep(delay)
        shell("clear")
    }
}
