//
//  SettingsButtons.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class SettingsButtons: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (SettingsScene:SKScene) {
        Background = SettingsScene
        size = SettingsScene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        addDifficultyButton()
        addAccountSettingsButton()
        addChooseShipButton()
        addBackButton()
    }
    
    func loadDifficultyScene() {
        addBackButton2()
        addEasyButton()
        addNormalButton()
        addHardButton()
    }
    
    func loadAccountScene() {
        self.removeAllChildren()
        addBackButton2()
        addGameTypeToggle()
        addControlTypeToggle()
    }
    
    fileprivate func addDifficultyButton() {
        let label = ViewHelper.createButton("Difficulty", name: "BTN-difficulty", xCord: (size.width / 3.4), yChord: (0 - (size.height / 3.9)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addAccountSettingsButton() {
        let label = ViewHelper.createButton("Account Settings", name: "BTN-accountSettings", xCord: (size.width / 5), yChord: (0 - (size.height / 12)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addChooseShipButton() {
        let label = ViewHelper.createButton("Choose Ship", name: "BTN-chooseShip", xCord: (size.width / 4), yChord: (0 - (size.height / 5.8)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addBackButton() {
        let label = ViewHelper.createButton("Back", name: "BTN-loadMenuScene", xCord: (size.width / 4), yChord: (0 - (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addBackButton2() {
        let label = ViewHelper.createButton("Back", name: "BTN-loadSettingsScene", xCord: (size.width / 4), yChord: (0 - (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addEasyButton() {
        let label = ViewHelper.createButton("Easy", name: "BTN-easyDifficulity", xCord: (0), yChord: (0 + (size.height / 6)), fontSize: (size.width / 12), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addNormalButton() {
        let label = ViewHelper.createButton("Normal", name: "BTN-normalDifficulity", xCord: (0), yChord: (0 - (0)), fontSize: (size.width / 12), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addHardButton() {
        let label = ViewHelper.createButton("Hard", name: "BTN-hardDifficulity", xCord: (0), yChord: (0 - (size.height / 6)), fontSize: (size.width / 12), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addGameTypeToggle() {
        let label = ViewHelper.createButton("GameType: \(GameSettings().getGameType())", name: "TGL-gameType", xCord: (0), yChord: (0 + (size.height / 8)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addControlTypeToggle() {
        let label = ViewHelper.createButton("Controls: \(GameSettings().getControlType())", name: "TGL-controlType", xCord: (0), yChord: (0 - (size.height / 8)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
}

