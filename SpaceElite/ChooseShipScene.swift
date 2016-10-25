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
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if (node.name) != nil {
                let array = node.name!.components(separatedBy: "-")
                let action = array[1]
                
                TouchController().buttonPressed(action: action, view: self.view! as SKView)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        TouchController().touchesEnded(touches, with: event)
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
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
