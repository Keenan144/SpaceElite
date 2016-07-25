//
//  ChooseShipScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ChooseShipScene: SKScene {
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
        case "loadSettingsScene":
            loadSettingsScene()
        case "difficulty":
            print("DIFFICULTY")
        case "accountSettings":
            print("ACCOUNT SETTINGS")
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
        ChooseShipBackground(ChooseShipScene: self).addBackground()
    }
    
    private func addGlitter() {
        ChooseShipBackground(ChooseShipScene: self).addGlitter()
        
    }
    
    private func addNavButtons() {
        ChooseShipButtons(ChooseShipScene: self).addButtons()
    }
    
    private func addTitle() {
        ChooseShipLabels(ChooseShipScene: self).addTitle()
    }
    
    private func loadSettingsScene() {
        if let scene = SettingsScene(fileNamed:"SettingsScene") {
            let skView = self.view
            
            ViewHelper.skviewSettings(skView!)
            ViewHelper.sceneViewSettings(scene, skView: skView!)
            
            skView!.presentScene(scene)
        }
    }
}
