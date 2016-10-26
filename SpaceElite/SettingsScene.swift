//
//  SettingsScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class SettingsScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if (node.name) != nil {
                let array = node.name!.components(separatedBy: "-")
                let action = array[1]
                if array[0] == "BTN" {
                    TouchController().buttonPressed(action: action, view: self.view! as SKView, scene: self.scene! as SKScene)
                } else if array[0] == "TGL" {
                    TouchController().togglePressed(node, scene: self.scene! as SKScene)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesEnded(touches, with: event)
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
    
    func loadDifficultySettingsScene(scene: SKScene) {
        scene.removeAllChildren()
        SettingsButtons(SettingsScene: scene).loadDifficultyScene()
    }

    func accountSettings(scene: SKScene) {
        scene.removeAllChildren()
        SettingsBackground(SettingsScene: scene).addBackground()
        SettingsButtons(SettingsScene: scene).loadAccountScene()
    }
    
    fileprivate func addBackground() {
        SettingsBackground(SettingsScene: self).addBackground()
    }
    
    fileprivate func addGlitter() {
        SettingsBackground(SettingsScene: self).addGlitter()
        
    }
    
    fileprivate func addNavButtons() {
        SettingsButtons(SettingsScene: self).addButtons()
    }
    
    fileprivate func addTitle() {
        SettingsLabels(SettingsScene: self).addTitle()
    }
}
