//
//  GameSettings.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameSettings: SKNode {
    
    var settingsData = UserDefaults()
    
    func setGameSettingsToDefault() {
        settingsData.set("touchToMove", forKey: "controlType")
        settingsData.set("difficulity", forKey: "normal")
        settingsData.set("gameType", forKey: "cometFall")
    }
    
    func setControlType() {
        if (settingsData.object(forKey: "controlType") == nil) || (settingsData.object(forKey: "controlType") as! String == "dragToMove") {
            settingsData.set("touchToMove", forKey: "controlType")
        } else {
            settingsData.set("dragToMove", forKey: "controlType")
        }
    }
    
    func setDifficulty(_ value: String) {
        settingsData.set("\(value)", forKey: "difficulity")
        print("Game Difficulity set to: \(settingsData.object(forKey: "difficulity"))")
        print("Game Difficulity sould have been set to: \(value)")
    }
    
    func setGameType() {
        if (settingsData.object(forKey: "gameType") == nil) || (settingsData.object(forKey: "gameType") as! String == "cometFall") {
            settingsData.set("practice", forKey: "gameType")
        } else {
            settingsData.set("cometFall", forKey: "gameType")
        }
    }
    
    func getControlType() -> String {
        if settingsData.object(forKey: "controlType") == nil {
            setControlType()
        }
        return settingsData.object(forKey: "controlType") as! String
    }
    
    func getDifficulty() -> String {
        if settingsData.object(forKey: "difficulity") == nil {
            setDifficulty("normal")
        }
        return settingsData.object(forKey: "difficulity") as! String
    }
    
    func getGameType() -> String {
        if settingsData.object(forKey: "gameType") == nil {
            setGameType()
        }
        return settingsData.object(forKey: "gameType") as! String
        
    }

    func reset() {
        setGameSettingsToDefault()
    }
    
    func loadSettings() {
        if settingsData.object(forKey: "controlType") == nil {
            setControlType()
        }
        
        if settingsData.object(forKey: "difficulity") == nil {
            setDifficulty("normal")
        }
        
        if settingsData.object(forKey: "gameType") == nil {
            setGameType()
        }
    }
}
