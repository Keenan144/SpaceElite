//
//  GamesceneButtons.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 7/29/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GamesceneButtons: SKNode {
    func addButtons(scene: SKScene) {
        addBackButton(scene: scene)
    }
    
    func addGameOver(scene: SKScene) {
        addBackground(scene: scene)
        addRestartButton(scene: scene)
        addContinueButton(scene: scene)
        addLeaderboardsButton(scene: scene)
    }
    
    func addHUD(scene: SKScene) {
        addBackground(scene: scene)
        addSettingsButton(scene: scene)
        addLeaderboardsButton(scene: scene)
        addStartGameButton(scene: scene)
        addDifficulityButton(scene: scene)
        addControlTypeButton(scene: scene)
    }
    
//    ************************************** Private **************************************
    fileprivate func addBackground(scene: SKScene) {
        let hudBackGround = ViewHelper.createSKSpriteNode(xCord: 0, yCord: 0, color: UIColor.gray, width: scene.size.width / 1.3, height: scene.size.width / 1.3, zPosition: 30, name: "div", texture: SKTexture(imageNamed: "NODE_hud_01"))
        
        scene.addChild(hudBackGround)
    }
    
    fileprivate func addBackButton(scene: SKScene) {
        let label = ViewHelper.createButton("pause", name: "BTN-pause", xCord: (scene.size.width / 3.0), yChord: (0 + (scene.size.height / 2.5)), fontSize: (scene.size.width / 18), zPosition: 50)

        scene.addChild(label)
    }
    
    fileprivate func addSettingsButton(scene: SKScene) {
        let label = ViewHelper.createButton("End Game", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (scene.size.height / 7)), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
 
        scene.addChild(label)
    }
    
    fileprivate func addLeaderboardsButton(scene: SKScene) {
        let label = ViewHelper.createButton("Score: \(GameState().getScore())", name: "BTN-loadLeaderboardsScene", xCord: (0), yChord: (scene.size.height / 7), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
  
        scene.addChild(label)
    }
    
    fileprivate func addDifficulityButton(scene: SKScene) {
        let label = ViewHelper.createButton("Difficulity: \(GameSettings().getDifficulty())", name: "LBL-difficulity", xCord: (0), yChord: (scene.size.height / 22), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
        
        scene.addChild(label)
    }
    
    fileprivate func addControlTypeButton(scene: SKScene) {
        let label = ViewHelper.createButton("Controls: \(GameSettings().getControlType())", name: "LBL-controlType", xCord: (0), yChord: (0 - (scene.size.height / 22)), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
        
        scene.addChild(label)
    }
    
    fileprivate func addStartGameButton(scene: SKScene) {
        let label = ViewHelper.createSKSpriteNode(xCord: (scene.size.width / 2.8), yCord: (0 + (scene.size.height / 4.8)), color: UIColor.gray, width: 40, height: 40, zPosition: 50, name: "BTN-resume", texture: SKTexture(imageNamed: "BTN_exit_02"))
   
        scene.addChild(label)
    }
    
    fileprivate func addContinueButton(scene: SKScene) {
        let label = ViewHelper.createButton("Continue", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (scene.size.height / 7)), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
        
        scene.addChild(label)
    }
    
    fileprivate func addRestartButton(scene: SKScene) {
        let label = ViewHelper.createButton("New Game", name: "BTN-newGame", xCord: (0), yChord: (0 - (scene.size.height / 11)), fontSize: (scene.size.width / 18), zPosition: 50)
        
        label.fontColor = UIColor.black
        
        scene.addChild(label)
    }
}
