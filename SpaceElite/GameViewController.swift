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
        GameViewController().loadScene(scene: "MenuScene", view: self.view! as! SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    func loadScene(scene: String, view: SKView, fadeColor: UIColor, fadeDuration: Float) {
        if let scene = MenuScene(fileNamed:scene) {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: fadeColor, duration: TimeInterval(fadeDuration)))
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
