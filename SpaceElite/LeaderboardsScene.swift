//
//  LeaderboardsScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class LeaderboardsScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            
            if (node.name != nil) && (node.name!.range(of: "BTN") != nil) {
                buttonPressed(node)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func buttonPressed(_ node: SKNode) {
        let array = node.name!.components(separatedBy: "-")
        let action = array[1]
        
        switch action {
        case "loadMenuScene":
            GameViewController().loadScene(scene: "MenuScene", view: self.view! as SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
        case "loadSettingsScene":
            GameViewController().loadScene(scene: "SettingsScene", view: self.view! as SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
        case "loadLeaderboardsScene":
            GameViewController().loadScene(scene: "LeaderboardsScene", view: self.view! as SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
        case "newGame":
            GameViewController().loadScene(scene: "GameScene", view: self.view! as SKView, fadeColor: UIColor.black, fadeDuration: 0.2)
        default:
            return
        }
    }
    
    func loadBackground() {
        addBackground()
        addGlitter()
    }
    
    func loadButtons() {
        addNavButtons()
    }
    
    func loadLabels() {
        addTitle()
    }
    
    fileprivate func addBackground() {
        LeaderboardsBackground(LeaderboardsScene: self).addBackground()
    }
    
    fileprivate func addGlitter() {
        LeaderboardsBackground(LeaderboardsScene: self).addGlitter()
        
    }
    
    fileprivate func addNavButtons() {
        LeaderboardsButtons(LeaderboardsScene: self).addButtons()
    }
    
    fileprivate func addTitle() {
        LeaderboardsLabels(LeaderboardsScene: self).addTitle()
    }
}
