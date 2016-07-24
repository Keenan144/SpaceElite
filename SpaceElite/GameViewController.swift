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
        loadMenuScene()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func loadMenuScene() {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
                let skView = self.view as! SKView
                ViewHelper.skviewSettings(skView)
                ViewHelper.sceneViewSettings(scene, skView: skView)
            
                skView.presentScene(scene)
            }
    }
    
    func loadSettingsScene() {
        if let scene =  SettingsScene(fileNamed:"SettingsScene") {
            // Configure the view.
            let skView = self.view as! SKView
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadLeaderboards() {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = self.view as! SKView
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
    
    func loadGame() {
        if let scene = MenuScene(fileNamed:"MenuScene") {
            // Configure the view.
            let skView = self.view as! SKView
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene)
        }
    }
}
