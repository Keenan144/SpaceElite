//
//  MenuScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/21/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if (node.name) != nil {
                let array = node.name!.components(separatedBy: "-")
                let action = array[1]
                
                TouchController().buttonPressed(action: action, view: self.view! as SKView, scene: self.scene! as SKScene)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesEnded(touches, with: event)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
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
    
    fileprivate func addBackground() {
        MenuBackground(MenuScene: self).addBackground()
    }
    
    fileprivate func addGlitter() {
        MenuBackground(MenuScene: self).addGlitter()

    }
    
    fileprivate func addNavButtons() {
        MenuButtons(MenuScene: self).addButtons()
    }
    
    fileprivate func addTitle() {
        MenuLabels(MenuScene: self).addTitle()
    }
    
    fileprivate func loadSettingsScene() {
        if let scene = SettingsScene(fileNamed:"SettingsScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
    
    fileprivate func loadLeaderboardsScene() {
        if let scene = LeaderboardsScene(fileNamed:"LeaderboardsScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
    
    fileprivate func loadGame() {
        if let scene = GameScene(fileNamed:"GameScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 1.0))
        }
    }
}
