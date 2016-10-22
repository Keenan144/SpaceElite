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
        let divSize = CGSize(width: size.width / 1.5, height: size.width / 1.5)
        let div = SKSpriteNode(color: UIColor.gray, size: divSize)
        
        div.position = CGPoint(x: 0, y: 0)
        div.zPosition = 20
        div.name = "div"
        
        Background?.addChild(div)
    }
    
    fileprivate func addBackButton() {
        let label = ViewHelper.createButton("pause", name: "BTN-pause", xCord: (size.width / 3.0), yChord: (0 + (size.height / 2.5)), fontSize: (size.width / 18), zPosition: 20)

        Background?.addChild(label)
    }
    
    fileprivate func addSettingsButton() {
        let label = ViewHelper.createButton("End Game", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (size.height / 7)), fontSize: (size.width / 18), zPosition: 20)
 
        Background?.addChild(label)
    }
    
    fileprivate func addLeaderboardsButton() {
        let label = ViewHelper.createButton("Score: \(GameState().getScore())", name: "BTN-loadLeaderboardsScene", xCord: (0), yChord: (size.height / 7), fontSize: (size.width / 18), zPosition: 20)
  
        Background?.addChild(label)
    }
    
    fileprivate func addDifficulityButton() {
        let label = ViewHelper.createButton("Difficulity: \(GameSettings().getDifficulty())", name: "LBL-difficulity", xCord: (0), yChord: (size.height / 22), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addControlTypeButton() {
        let label = ViewHelper.createButton("Controls: \(GameSettings().getControlType())", name: "LBL-controlType", xCord: (0), yChord: (0 - (size.height / 22)), fontSize: (size.width / 18), zPosition: 20)
        
        Background?.addChild(label)
    }
    
    fileprivate func addStartGameButton() {
        let label = ViewHelper.createExitButton(xCord: (size.width / 4), yChord: (0 + (size.height / 5)))
   
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
