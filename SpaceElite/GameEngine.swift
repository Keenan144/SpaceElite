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
    
//    func handleTouch(node: SKNode, player: SKNode, touch: UITouch) {
//        if (node.name != nil) && (node.name!.range(of: "BTN") != nil) {
//            GameScene().buttonPressed(node)
//            return
//        } else if GameSettings().getControlType() == "touchToMove" {
//            if touch.location(in: self).x > 0 {
//                let action = SKAction.move(to: CGPoint(x: self.frame.maxX, y: player.position.y), duration: 0.4)
//                GameScene().movePlayer(moveAction: action)
//            } else {
//                let action = SKAction.move(to: CGPoint(x: self.frame.minX, y: player.position.y), duration: 0.4)
//                GameScene().movePlayer(moveAction: action)
//            }
//        }
//    }
}
