//
//  GameEngine.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/18/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameEngine: SKScene, SKPhysicsContactDelegate {
    var myTimer = NSTimer()
    var enemy = SKNode()

//    init (GameScene:SKScene) {
////        get level data
//       
//        super.init()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func start() {
//        start game
    }
    
    func enemyMovementTimer() {
        myTimer =  NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("moveEnemy"), userInfo: nil, repeats: true)
    }
    
    func moveEnemy() {
        Enemy(GameScene: self).move(self.enemy)
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
}
