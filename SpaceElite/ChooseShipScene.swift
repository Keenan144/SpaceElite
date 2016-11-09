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
        loadShips()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if (node.name) != nil {
                let array = node.name!.components(separatedBy: "-")
                
                if array[0] == "BTN" {
                    let action = array[1]
                    TouchController().buttonPressed(action: action, view: self.view! as SKView, scene: self.scene! as SKScene, className: self)
                } else {
                    TouchController().chooseShip(ship: node.name!)
                    log.warning("node: \(node.name)")
                    log.warning("")
                }
            }
        }
    }
    
    func loadBackground() {
        ChooseShipBackground(ChooseShipScene: self).addBackground()
    }
    
    func loadButtons() {
        ChooseShipButtons(ChooseShipScene: self).addButtons()
    }
    
    func loadLabels() {
        ChooseShipLabels(ChooseShipScene: self).addTitle()
    }
    
    func loadShips() {
        Ships(ChooseShipScene: self).renderShipsForSelection()
    }
}
