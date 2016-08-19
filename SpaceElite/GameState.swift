//
//  GameState.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/18/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameState: SKScene, SKPhysicsContactDelegate {
    
    var gameOver    = Bool(true)
    var bossDead    = Bool(true)
    var level       = Int(1)
    var lastSave    = NSDate()
 
    init (GameScene:SKScene) {
//        get level data
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getLevel() -> Int {
        return level
    }
    
    func isGameOver() -> Bool {
        return gameOver
    }
    
    func isBossDead() -> Bool {
        return bossDead
    }
    
    func whenWasLastSave() -> NSDate {
        return lastSave
    }
}