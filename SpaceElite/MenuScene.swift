//
//  MenuScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/21/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let node = self.nodeAtPoint(touch.locationInNode(self))
            
            if (node.name != nil) && (node.name!.rangeOfString("BTN") != nil) {
                buttonPressed(node)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func buttonPressed(node: SKNode) {
        let array = node.name!.componentsSeparatedByString("-")
        let action = array[1]
        
        switch action {
        case "loadSettingsScene":
            loadSettingsScene()
        case "loadLeaderboardsScene":
            loadLeaderboardsScene()
        case "loadGame":
            loadGame()
        default:
            return
        }
    }
    
    func loadBackground() {
        addBackground()
        addGlitter()
    }
    
    func loadButtons() {
        addNavButtons()
    }
    
    func loadLabels() {
        addTitle()
    }
    
    private func addBackground() {
        MenuBackground(MenuScene: self).addBackground()
    }
    
    private func addGlitter() {
        MenuBackground(MenuScene: self).addGlitter()

    }
    
    private func addNavButtons() {
        MenuButtons(MenuScene: self).addButtons()
    }
    
    private func addTitle() {
        MenuLabels(MenuScene: self).addTitle()
    }
    
    private func loadSettingsScene() {
        if let scene = SettingsScene(fileNamed:"SettingsScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
    
    private func loadLeaderboardsScene() {
        if let scene = LeaderboardsScene(fileNamed:"LeaderboardsScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
    
    private func loadGame() {
        if let scene = GameScene(fileNamed:"GameScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
}
