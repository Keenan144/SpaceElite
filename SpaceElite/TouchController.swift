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

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    func buttonPressed(action: String, view: SKView, scene: SKScene, className: Any) {
        log.debug("action: \(action)")
        log.debug("view: \(view)")
        log.debug("scene: \(scene)")
        log.debug("class: \(className)")
        DispatchQueue.global(qos: .background).async {
            log.info("\(GameState().getGameState())")
             DispatchQueue.main.async {
                switch action {
                case "pause":
                    GameScene(fileNamed: "GameScene")!.pause(scene: scene)
                case "resume":
                    GameScene(fileNamed: "GameScene")!.resume(scene: scene)
                case "endGame":
                    GameScene().loadGameOver(scene: scene, className: className)
                case "loadMenuScene":
                    GameViewController().loadScene(scene: MenuScene(fileNamed: "MenuScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "loadSettingsScene":
                    GameViewController().loadScene(scene: SettingsScene(fileNamed: "SettingsScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "loadLeaderboardsScene":
                    GameViewController().loadScene(scene: LeaderboardsScene(fileNamed: "LeaderboardsScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "newGame":
                    GameViewController().loadScene(scene: GameScene(fileNamed: "GameScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "chooseShip":
                    GameViewController().loadScene(scene: ChooseShipScene(fileNamed: "ChooseShipScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                case "difficulty":
                    SettingsScene(fileNamed: "SettingsScene")!.loadDifficultySettingsScene(scene: scene)
                case "accountSettings":
                    SettingsScene(fileNamed: "SettingsScene")!.accountSettings(scene: scene)
                case "loadGame":
                    GameViewController().loadScene(scene: GameScene(fileNamed: "GameScene")!, view: view, fadeColor: UIColor.black, fadeDuration: 0.2)
                default:
                    return
                }
            }
        }
    }
    
    func togglePressed(_ node: SKNode, scene: SKScene) {
        let array = node.name!.components(separatedBy: "-")
        let action = array[1]
        log.debug("togglePressed: \(action) for scene: \(scene)")
        
        switch action {
        case "controlType":
            GameSettings().setControlType()
            SettingsScene(fileNamed: "SettingsScene")!.accountSettings(scene: scene)
        case "gameType":
            GameSettings().setGameType()
            SettingsScene(fileNamed: "SettingsScene")!.accountSettings(scene: scene)
        case "easyDifficulity":
            GameSettings().setDifficulty("easy")
        case "normalDifficulity":
            GameSettings().setDifficulty("normal")
        case "hardDifficulity":
            GameSettings().setDifficulty("hard")
        default:
            return
        }
    }
    
    func chooseShip(ship: String) {
        GameState().setUserShip(value: ship)
    }
}
