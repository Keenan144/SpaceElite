//
//  GameScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/21/16.
//  Copyright (c) 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKNode()
    var lastUpdateTime: NSTimeInterval = 0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        view.showsPhysics = true
        physicsWorld.contactDelegate = self
        
        Boundaries(GameScene: self).setBoundaries()
        player = Player(GameScene: self).spawn(0x1 << 1, rockCategory: 0x1 << 2)
        //        start()
        loadBackground()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let node = self.nodeAtPoint(touch.locationInNode(self))
            var touchLocation = touch.locationInNode(self)
            
            if (node.name != nil) && (node.name!.rangeOfString("BTN") != nil) {
                buttonPressed(node)
            } else {
                touchLocation = touch.locationInNode(self)
                player.position.x = touchLocation.x
                print(player.position.x)
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            var touchLocation = touch.locationInNode(self)
            touchLocation = touch.locationInNode(self)
            player.position.x = touchLocation.x
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let deltaTime = currentTime - lastUpdateTime
        let currentFPS = 1 / deltaTime
        
        lastUpdateTime = currentTime
    }
    
    func buttonPressed(node: SKNode) {
        let array = node.name!.componentsSeparatedByString("-")
        let action = array[1]
        
        switch action {
        case "loadSettingsScene":
            loadSettingsScene()
        case "loadLeaderboardsScene":
            loadLeaderboardsScene()
        default:
            return
        }
    }
    
    func loadBackground() {
        addBackground()
        addGlitter()
    }
    
    private func addBackground() {
        MenuBackground(MenuScene: self).addBackground()
    }
    
    private func addGlitter() {
        MenuBackground(MenuScene: self).addGlitter()
        
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
}
