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
    var enemy = SKNode()
    var lastUpdateTime: NSTimeInterval = 0
    var realFPS = Double()
    var myTimer = NSTimer()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        view.showsPhysics = true
        physicsWorld.contactDelegate = self
        
        initGameScene()
        initGamePlayer()
        GameState.load()
        GameEngine().start()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let node = self.nodeAtPoint(touch.locationInNode(self))
            let touchLocation = touch.locationInNode(self)
            
            if (node.name != nil) && (node.name!.rangeOfString("BTN") != nil) {
                buttonPressed(node)
            } else {
                player.position.x = touchLocation.x
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.locationInNode(self)
            player.position.x = touchLocation.x
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let deltaTime = currentTime - lastUpdateTime
        let currentFPS = 1 / deltaTime
    
        realFPS = currentFPS
        lastUpdateTime = currentTime
    }
    
    func initGameScene() {
        setBoundaries()
        loadBackground()
        loadButtons()
//        enemyMovementTimer()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
//        if (contact.bodyA.categoryBitMask == boundaryCategory) {
//            contact.bodyB.node?.removeFromParent()
//            print("GAMESCENE: scoreIncresed")
//            increaseScore()
//            refreshScoreView()
//        }
//        if (contact.bodyA.categoryBitMask == shipCategory) {
//            contact.bodyB.node?.physicsBody?.collisionBitMask = 0
//            if (contact.bodyB.node?.name == "Health") {
//                contact.bodyB.node?.removeFromParent()
//                increaseHealth()
//            } else if (contact.bodyB.node?.name == "ScoreBump") {
//                contact.bodyB.node?.removeFromParent()
//                bumpScore()
//            } else if (contact.bodyB.node?.name == "Invincibility") {
//                contact.bodyB.node?.removeFromParent()
//                makeInvincible()
//                showInvincibleLabel()
//            } else if (contact.bodyB.node?.name == "Rock") {
//                if Helper.isInvincible() == false {
//                    contact.bodyB.node?.r/emoveFromParent()
//                    SpaceShip.deductHealth(Helper.deductHealth())
//                    if SpaceShip.dead() {
//                        stopRocks()
//                        endGame()
//                    }
//                }
//            }
//            refreshHealthView()
//        }
    }
    
    func buttonPressed(node: SKNode) {
        let array = node.name!.componentsSeparatedByString("-")
        let action = array[1]
        
        switch action {
        case "pause":
            self.paused = true
            GameViewController().loadHUD(self)
            self.childNodeWithName("BTN-pause")?.removeFromParent()
        case "resume":
            self.paused = false
            self.childNodeWithName("div")?.removeFromParent()
            self.childNodeWithName("BTN-loadMenuScene")?.removeFromParent()
            self.childNodeWithName("BTN-loadLeaderboardsScene")?.removeFromParent()
            self.childNodeWithName("BTN-resume")?.removeFromParent()
            loadButtons()
        case "loadMenuScene":
            self.removeAllActions()
            self.removeAllChildren()
            myTimer.invalidate()
            GameViewController().loadMenuScene(self.view! as SKView)
        case "loadSettingsScene":
            GameViewController().loadSettingsScene(self.view! as SKView)
        case "loadLeaderboardsScene":
            GameViewController().loadLeaderboardsScene(self.view! as SKView)
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
    
    func loadHUD() {
        GamesceneButtons(Gamescene: self).addHUD()
    }
    
    private func initGamePlayer() {
        player = Player(GameScene: self).spawn(0x1 << 1, rockCategory: 0x1 << 2)
    }
    
    private func initGameEnemy() {
        enemy = Enemy(GameScene: self).spawn(0x1 << 1, rockCategory: 0x1 << 2)
    }
    
    private func setBoundaries() {
        Boundaries(GameScene: self).setBoundaries()
    }
    
    private func addBackground() {
        MenuBackground(MenuScene: self).addBackground()
    }
    
    private func addGlitter() {
        MenuBackground(MenuScene: self).addGlitter()
        
    }
    
    private func addNavButtons() {
        GamesceneButtons(Gamescene: self).addButtons()
    }
}
