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
    
    private func addDifficultyButton() {
        let label = ViewHelper.createButton("Difficulty", name: "BTN-difficulty", xCord: (size.width / 3.4), yChord: (0 - (size.height / 3.9)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    private func addAccountSettingsButton() {
        let label = ViewHelper.createButton("Account Settings", name: "BTN-accountSettings", xCord: (size.width / 5), yChord: (0 - (size.height / 12)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    private func addChooseShipButton() {
        let label = ViewHelper.createButton("Choose Ship", name: "BTN-chooseShip", xCord: (size.width / 4), yChord: (0 - (size.height / 5.8)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    private func addBackButton() {
        let label = ViewHelper.createButton("Back", name: "BTN-loadMenuScene", xCord: (size.width / 4), yChord: (0 - (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)

        Background?.addChild(label)
    }
}

