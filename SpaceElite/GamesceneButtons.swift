//
//  GamesceneButtons.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/29/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GamesceneButtons: SKNode {
    var Background: SKScene?
    var size: CGSize
    
    init (Gamescene:SKScene) {
        Background = Gamescene
        size = Gamescene.frame.size
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        addBackButton()
    }
    
    func addGameOver() {
        addBackground()
        addRestartButton()
        addContinueButton()
        addLeaderboardsButton()
    }
    
    func addHUD() {
        addBackground()
        addSettingsButton()
        addLeaderboardsButton()
        addStartGameButton()
        addDifficulityButton()
        addControlTypeButton()
    }
    
//    ************************************** Private **************************************
    fileprivate func addBackground() {
        let hudBackGround = ViewHelper.createSKSpriteNode(xCord: 0, yCord: 0, color: UIColor.gray, width: size.width / 1.3, height: size.width / 1.3, zPosition: 30, name: "div", texture: SKTexture(imageNamed: "NODE_hud_01"))
        
        Background?.addChild(hudBackGround)
    }
    
    fileprivate func addBackButton() {
        let label = ViewHelper.createButton("pause", name: "BTN-pause", xCord: (size.width / 3.0), yChord: (0 + (size.height / 2.5)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addSettingsButton() {
        let label = ViewHelper.createButton("End Game", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (size.height / 7)), fontSize: (size.width / 18), zPosition: 20)
        
        label.fontColor = UIColor.black
 
        Background?.addChild(label)
    }
    
    fileprivate func addLeaderboardsButton() {
        let label = ViewHelper.createButton("Score: \(GameState().getScore())", name: "BTN-loadLeaderboardsScene", xCord: (0), yChord: (size.height / 7), fontSize: (size.width / 18), zPosition: 20)
        
        label.fontColor = UIColor.black
  
        Background?.addChild(label)
    }
    
    fileprivate func addDifficulityButton() {
        let label = ViewHelper.createButton("Difficulity: \(GameSettings().getDifficulty())", name: "LBL-difficulity", xCord: (0), yChord: (size.height / 22), fontSize: (size.width / 18), zPosition: 20)
        
        label.fontColor = UIColor.black
        
        Background?.addChild(label)
    }
    
    fileprivate func addControlTypeButton() {
        let label = ViewHelper.createButton("Controls: \(GameSettings().getControlType())", name: "LBL-controlType", xCord: (0), yChord: (0 - (size.height / 22)), fontSize: (size.width / 18), zPosition: 20)
        
        label.fontColor = UIColor.black
        
        Background?.addChild(label)
    }
    
    fileprivate func addStartGameButton() {
        let label = ViewHelper.createSKSpriteNode(xCord: (size.width / 2.8), yCord: (0 + (size.height / 4.8)), color: UIColor.gray, width: 40, height: 40, zPosition: 50, name: "BTN-resume", texture: SKTexture(imageNamed: "BTN_exit_02"))
   
        Background?.addChild(label)
    }
    
    fileprivate func addContinueButton() {
        let label = ViewHelper.createButton("Continue", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (size.height / 7)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addRestartButton() {
        let label = ViewHelper.createButton("New Game", name: "BTN-newGame", xCord: (0), yChord: (0 - (size.height / 11)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
}
