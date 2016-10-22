//
//  GameEngine.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/18/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameEngine: SKScene, SKPhysicsContactDelegate {
    var myTimer = Timer()
    var enemy = SKNode()
    
    func buildGame() {
        GameState().toggleGameOver(false)
        GameState().setPlayersHealth(100)
        GameState().setScore(0)
    }
    
    func enemyMovementTimer() {
        myTimer =  Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(GameEngine.moveEnemy), userInfo: nil, repeats: true)
    }
    
    func moveEnemy() {
        Enemy(GameScene: self).move(self.enemy)
    }
    
    func deductPlayerHealth() {
        if GameState().getPlayerHealth() > 0 {
            GameState().setPlayersHealth((GameState().getPlayerHealth() - 10))
        }
    }
}
