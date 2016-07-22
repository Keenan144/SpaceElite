//
//  MenuScene.swift
//  SpaceElite
//
//  Created by Keenan Sturtevant on 7/21/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        loadBackground()
        loadButtons()
        loadLabels()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
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
    
    private func addBackground() {
        MenuBackground(MenuScene: self).addBackground()
    }
    
    private func addGlitter() {
        MenuBackground(MenuScene: self).addGlitter()

    }
    
    private func addNavButtons() {
        MenuButtons(MenuScene: self).addButtons()
    }
    
    private func addTitle() {
        MenuLabels(MenuScene: self).addTitle()
    }
}