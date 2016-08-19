//
//  SettingsScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/23/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class SettingsScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let node = self.nodeAtPoint(touch.locationInNode(self))
            
            if (node.name != nil) && (node.name!.rangeOfString("BTN") != nil) {
                buttonPressed(node)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func buttonPressed(node: SKNode) {
        let array = node.name!.componentsSeparatedByString("-")
        let action = array[1]
        
        switch action {
        case "loadMenuScene":
            GameViewController().loadMenuScene(self.view! as SKView)
        case "difficulty":
            print("DIFFICULTY")
        case "accountSettings":
            print("ACCOUNT SETTINGS")
        case "chooseShip":
            GameViewController().loadChooseShipScene(self.view! as SKView)
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
    
    private func addBackground() {
        SettingsBackground(SettingsScene: self).addBackground()
    }
    
    private func addGlitter() {
        SettingsBackground(SettingsScene: self).addGlitter()
        
    }
    
    private func addNavButtons() {
        SettingsButtons(SettingsScene: self).addButtons()
    }
    
    private func addTitle() {
        SettingsLabels(SettingsScene: self).addTitle()
    }
}
