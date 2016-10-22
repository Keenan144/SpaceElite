//
//  GameViewController.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/21/16.
//  Copyright (c) 2016 Keenan Sturtevant. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMenuScene(self.view as! SKView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
//
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    func loadMenuScene(_ view: SKView) {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
        
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.2))
        }
    }
    
    func loadSettingsScene(_ view: SKView) {
        if let scene =  SettingsScene(fileNamed:"SettingsScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.2))
        }
    }
    
    func loadLeaderboards(_ view: SKView) {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.8))
        }
    }
    
    func loadGame(_ view: SKView) {
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.8))
        }
    }
    
    func loadChooseShipScene(_ view: SKView) {
        if let scene = ChooseShipScene(fileNamed:"ChooseShipScene") {
            let skView = view
            
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.8))
        }
    }
    
    func loadLeaderboardsScene(_ view: SKView) {
        if let scene = LeaderboardsScene(fileNamed:"LeaderboardsScene") {
            let skView = view
            
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: UIColor.black, duration: 0.8))
            
//            skView.presentScene(scene)
        }
    }
    
    func loadHUD(_ scene: SKScene) {
        GamesceneButtons(Gamescene: scene).addHUD()
    }
    
    func loadDifficultySettingsScene(_ scene: SKScene) {
        SettingsButtons(SettingsScene: scene).loadDifficultyScene()
    }
    
    func loadAccountSettingsScene(_ scene: SKScene) {
        SettingsButtons(SettingsScene: scene).loadAccountScene()
    }
    
}
