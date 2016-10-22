//
//  GameEngine.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/18/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameEngine: SKScene, SKPhysicsContactDelegate {
    
    func buildGame() {
        GameState().toggleGameOver(false)
        GameState().setPlayersHealth(100)
        GameState().setScore(0)
    }
    
    func deductPlayerHealth() {
        if GameState().getPlayerHealth() > 0 {
            GameState().setPlayersHealth((GameState().getPlayerHealth() - 10))
        }
    }
}
