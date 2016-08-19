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
    
    func addHUD() {
        addBackground()
        addSettingsButton()
        addLeaderboardsButton()
        addStartGameButton()
    }
    
//    ************************************** Private **************************************
    private func addBackground() {
        let divSize = CGSize(width: size.width / 1.5, height: size.width / 1.5)
        let div = SKSpriteNode(color: UIColor.grayColor(), size: divSize)
        
        div.position = CGPoint(x: 0, y: 0)
        div.zPosition = 20
        div.name = "div"
        
        Background?.addChild(div)
    }
    
    private func addBackButton() {
        let label = ViewHelper.createButton("pause", name: "BTN-pause", xCord: (size.width / 3.3), yChord: (0 + (size.height / 2.5)), fontSize: (size.width / 12), zPosition: 20)

        Background?.addChild(label)
    }
    
    private func addSettingsButton() {
        let label = ViewHelper.createButton("End Game", name: "BTN-loadMenuScene", xCord: (0), yChord: (0 - (size.height / 7)), fontSize: (size.width / 18), zPosition: 20)
 
        Background?.addChild(label)
    }
    
    private func addLeaderboardsButton() {
        let label = ViewHelper.createButton("Top Scores", name: "BTN-loadLeaderboardsScene", xCord: (0), yChord: (0), fontSize: (size.width / 18), zPosition: 20)
  
        Background?.addChild(label)
    }
    
    private func addStartGameButton() {
        let label = ViewHelper.createButton("Resume", name: "BTN-resume", xCord: (size.width / 4), yChord: (0 + (size.height / 5)), fontSize: (size.width / 12), zPosition: 20)
   
        Background?.addChild(label)
    }
}
