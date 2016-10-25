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
        GameViewController().loadScene(scene: MenuScene(fileNamed: "MenuScene")!, view: self.view! as! SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    
    func loadScene(scene: SKScene, view: SKView, fadeColor: UIColor, fadeDuration: Float) {
            // Configure the view.
            let skView = view
            ViewHelper.skviewSettings(skView)
            ViewHelper.sceneViewSettings(scene, skView: skView)
            
            skView.presentScene(scene, transition: SKTransition.fade(with: fadeColor, duration: TimeInterval(fadeDuration)))
    }
}
