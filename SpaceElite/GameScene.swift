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
    var lastUpdateTime: TimeInterval = 0
    var realFPS = Double()
    var myTimer = Timer()
    var boostTimer = Timer()
    var gameTimer = Timer()
    var gameTimerCounter = Int()
    var enemyMovementTimer = Timer()
    var healthLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    var contactDone = Bool()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if (node.name) != nil {
                let array = node.name!.components(separatedBy: "-")
                if array[0] == "BTN" {
                    let action = array[1]
                    TouchController().buttonPressed(action: action, view: self.view! as SKView, scene: self.scene! as SKScene)
                }
            } else {
                player.position.x = touch.location(in: self).x
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            player.position.x = touch.location(in: self).x
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.removeAllActions()
    }
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        view.showsPhysics = false
        physicsWorld.contactDelegate = self
        
//      ********************** Start game when inits are complete
        GameEngine().buildGame()
        GameState().createGameState()
        GameSettings().loadSettings()
        initGameScene()
        initGamePlayer()
    }
    
    func movePlayerWithAction(moveAction: SKAction) {
        player.run(moveAction)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contactDone == true {
            contactDone = false
            if contact.bodyB.node?.name == "Rock" {
                contact.bodyB.node?.removeFromParent()
                deductPlayerHealth()
            } else if contact.bodyB.node?.name == "Health" {
                contact.bodyB.node?.removeFromParent()
                increasePlayerHealth()
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        contactDone = true
    }
    
    func rockSpawnerTimer() {
        myTimer =  Timer.scheduledTimer(timeInterval: GameState().determineRockSpawnSpeed(), target: self, selector: #selector(spawnRock), userInfo: nil, repeats: true)
    }
    
    func startGameTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(incrementGameTimer), userInfo: nil, repeats: true)
    }
    
    func boostSpawnerTimer() {
        boostTimer =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(spawnBoost), userInfo: nil, repeats: true)
    }
    
    func incrementGameTimer() {
        gameTimerCounter += 1
        if gameTimerCounter == 15 {
            myTimer.invalidate()
            gameTimer.invalidate()
            rockSpawnerTimer()
            gameTimerCounter = 0
            startGameTimer()
            print("Difficulity Increased")
        }
    }
    
    func spawnRock() {
        if GameState().isGameOver() == false {
            let rock = Rock.spawn()
            print("spawned rock")
            rock.position = FunctionHelper().randomSpawnPoint((player.position.x - 120), valueHighX: (player.position.x + 120), valueY: frame.maxY)
            let moveAction = SKAction.move(to: CGPoint(x: rock.position.x, y: frame.minY), duration: (GameState().determineRockSpeed()))
            let removeRock = SKAction.removeFromParent()

            self.addChild(rock)
            rock.run(SKAction.sequence([moveAction, removeRock, SKAction.run(increaseScore)]))
        }
    }
    
    func spawnBoost() {
        if GameState().isGameOver() == false {
            let rock = Boost.spawn()
            print("spawned Boost")
            rock.position = FunctionHelper().randomSpawnPoint((player.position.x - 220), valueHighX: (player.position.x + 220), valueY: frame.maxY)
            let moveAction = SKAction.move(to: CGPoint(x: rock.position.x, y: frame.minY), duration: (2.0))
            let removeRock = SKAction.removeFromParent()
            
            self.addChild(rock)
            rock.run(SKAction.sequence([moveAction, removeRock]))
        }
    }
    
    func initGameScene() {
//        setBoundaries()
        loadBackground()
        loadButtons()
        AddScoreLabel()
        AddHealthLabel()
        rockSpawnerTimer()
        startGameTimer()
        boostSpawnerTimer()
    }
    
    func increaseSpawnRate() {
        myTimer.invalidate()
        rockSpawnerTimer()
    }
    
    func increaseScore() {
        GameState().setScore(GameState().getScore() + 10)
        scoreLabel.text = ("pts \(GameState().getScore())")
    }
    
    func deductPlayerHealth() {
        if GameState().getPlayerHealth() > 0 {
            GameState().setPlayersHealth((GameState().getPlayerHealth() - 10))
            healthLabel.text = ("hp \(GameState().getPlayerHealth())")
        } else {
            endGame()
            
            loadGameOver()
        }
    }
    
    func increasePlayerHealth() {
        GameState().setPlayersHealth((GameState().getPlayerHealth() + 10))
        healthLabel.text = ("hp \(GameState().getPlayerHealth())")

    }
    
    func AddHealthLabel() {
        healthLabel = ViewHelper.createButton("hp \(GameState().getPlayerHealth())", name: "LBL-health", xCord: (0 - (size.width / 2.95)), yChord: (0 + (size.height / 2.5)), fontSize: (size.width / 20), zPosition: 20)
        
        self.addChild(healthLabel)
    }
    
    func AddScoreLabel() {
        scoreLabel = ViewHelper.createButton("pts \(GameState().getScore())", name: "LBL-score", xCord: (0 - (size.width / 2.89)), yChord: (0 + (size.height / 2.9)), fontSize: (size.width / 20), zPosition: 20)
        
        self.addChild(scoreLabel)
    }
    
    func loadBackground() {
        addBackground()
    }
    
    func loadButtons() {
        addNavButtons()
    }
    
    func loadHUD() {
        GamesceneButtons(Gamescene: self).addHUD()
    }
    
    func loadGameOver() {
        GamesceneButtons(Gamescene: self).addGameOver()
    }
    
    func loadHUD(_ scene: SKScene) {
        GamesceneButtons(Gamescene: scene).addHUD()
    }
    
    func pause(scene: SKScene) {
        scene.isPaused = true
        GameState().toggleGameOver(true)
        scene.removeAllActions()
        myTimer.invalidate()
        gameTimer.invalidate()
        boostTimer.invalidate()
        GamesceneButtons(Gamescene: scene).addHUD()
    }
    
    func resume(scene: SKScene) {
        GameState().toggleGameOver(false)
        scene.childNode(withName: "div")?.removeFromParent()
        scene.childNode(withName: "BTN-loadMenuScene")?.removeFromParent()
        scene.childNode(withName: "BTN-loadLeaderboardsScene")?.removeFromParent()
        scene.childNode(withName: "BTN-resume")?.removeFromParent()
        scene.childNode(withName: "LBL-difficulity")?.removeFromParent()
        scene.childNode(withName: "LBL-controlType")?.removeFromParent()
        scene.isPaused = false
        rockSpawnerTimer()
        boostSpawnerTimer()
        startGameTimer()
    }
    
    fileprivate func initGamePlayer() {
        player = Player(GameScene: self).spawn(0x1 << 1, rockCategory: 0x1 << 2)
        contactDone = true
    }
    
    fileprivate func addBackground() {
        GameBackground(GameScene: self).addBackground()
    }
    
    fileprivate func addNavButtons() {
        GamesceneButtons(Gamescene: self).addButtons()
    }
    
    fileprivate func resumeGame() {
        self.childNode(withName: "div")?.removeFromParent()
        self.childNode(withName: "BTN-loadMenuScene")?.removeFromParent()
        self.childNode(withName: "BTN-loadLeaderboardsScene")?.removeFromParent()
        self.childNode(withName: "BTN-resume")?.removeFromParent()
        self.childNode(withName: "LBL-difficulity")?.removeFromParent()
        self.childNode(withName: "LBL-controlType")?.removeFromParent()
        self.isPaused = false
        rockSpawnerTimer()
        boostSpawnerTimer()
        startGameTimer()
    }
    
    fileprivate func endGame() {
        self.removeAllActions()
        self.removeAllChildren()
        myTimer.invalidate()
        gameTimer.invalidate()
        boostTimer.invalidate()
    }
}
