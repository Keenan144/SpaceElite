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

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func loadMenuScene(view: SKView) {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
        
            skView.presentScene(scene)
        }
    }
    
    func loadSettingsScene(view: SKView) {
        if let scene =  SettingsScene(fileNamed:"SettingsScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadLeaderboards(view: SKView) {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadGame(view: SKView) {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadChooseShipScene(view: SKView) {
        if let scene = ChooseShipScene(fileNamed:"ChooseShipScene") {
            let skView = view
            
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadLeaderboardsScene(view: SKView) {
        if let scene = LeaderboardsScene(fileNamed:"LeaderboardsScene") {
            let skView = view
            
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadHUD(scene: SKScene) {
        GamesceneButtons(Gamescene: scene).addHUD()
    }
}
