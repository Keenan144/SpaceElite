//
//  TouchController.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 10/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import UIKit
import SpriteKit

class TouchController: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches {
            
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if GameSettings().getControlType() == "dragToMove" {
            for touch in touches{
                let touchLocation = touch.location(in: self)
                print(touchLocation)
                
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("!!! Touches Ended !!!")
    }
    
    func buttonPressed(action: String, view: SKView) {
        
        DispatchQueue.global(qos: .background).async {
            let gameState = GameState().saveGameState()
            print(gameState)
             DispatchQueue.main.async {
                switch action {
                case "pause":
                    self.isPaused = true
                    //            myTimer.invalidate()
                    //            boostTimer.invalidate()
                    //            gameTimer.invalidate()
                    //            self.childNode(withName: "BTN-pause")?.removeFromParent()
                    GameViewController().loadHUD(self)
                case "resume":
                    print("resume")
                    //            resumeGame()
                //            loadButtons()
                case "loadMenuScene":
                    //            endGame()
                    GameViewController().loadScene(scene: MenuScene(fileNamed: "MenuScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "loadSettingsScene":
                    GameViewController().loadScene(scene: SettingsScene(fileNamed: "SettingsScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "loadLeaderboardsScene":
                    GameViewController().loadScene(scene: LeaderboardsScene(fileNamed: "LeaderboardsScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "newGame":
                    GameViewController().loadScene(scene: GameScene(fileNamed: "GameScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "difficulty":
                    print("difficulity")
                    //            removeAllChildren()
                    //            addBackground()
                //            GameViewController().loadDifficultySettingsScene(self.scene! as SKScene)
                case "accountSettings":
                    print("account settings")
                    //            removeAllChildren()
                    //            addBackground()
                //            GameViewController().loadAccountSettingsScene(self.scene! as SKScene)
                case "easyDifficulity":
                    GameSettings().setDifficulty("easy")
                case "normalDifficulity":
                    GameSettings().setDifficulty("normal")
                case "hardDifficulity":
                    GameSettings().setDifficulty("hard")
                case "accountSettings":
                    print("ACCOUNT SETTINGS")
                case "loadGame":
                    //            loadGame()
                    print("loadGame")
                    GameViewController().loadScene(scene: GameScene(fileNamed: "GameScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                default:
                    return
                }
            }
        }
    }
    
    func togglePressed(_ node: SKNode) {
        let array = node.name!.components(separatedBy: "-")
        let action = array[1]
        print(action)
        
        switch action {
        case "controlType":
            GameSettings().setControlType()
        case "gameType":
            GameSettings().setGameType()
        default:
            return
        }
        removeAllChildren()
//        addBackground()
        GameViewController().loadAccountSettingsScene(self.scene! as SKScene)
    }
}
