//
//  FunctionHelper.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/6/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class FunctionHelper: SKScene {
    func randomInRange(_ lo: CGFloat, hi : CGFloat) -> CGFloat {
        return lo + CGFloat(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
    func randomSpawnPoint(_ valueLowX: CGFloat, valueHighX: CGFloat, valueY: CGFloat) -> CGPoint {
        return CGPoint(x: randomInRange(valueLowX, hi: valueHighX), y: valueY + 100)
    }
    
    func randomTime(_ lo: Double, hi : Double) -> TimeInterval {
        return lo + Double(arc4random_uniform(UInt32(hi - lo + 1)))
    }
}
