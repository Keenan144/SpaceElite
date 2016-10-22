//
//  ChooseShipScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/24/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class ChooseShipScene: SKScene {
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
        case "loadSettingsScene":
            GameViewController().loadSettingsScene(self.view! as SKView)
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
    
    fileprivate func addBackground() {
        ChooseShipBackground(ChooseShipScene: self).addBackground()
    }
    
    fileprivate func addGlitter() {
        ChooseShipBackground(ChooseShipScene: self).addGlitter()
        
    }
    
    fileprivate func addNavButtons() {
        ChooseShipButtons(ChooseShipScene: self).addButtons()
    }
    
    fileprivate func addTitle() {
        ChooseShipLabels(ChooseShipScene: self).addTitle()
    }
}
