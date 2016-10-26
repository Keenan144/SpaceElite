//
//  GameState.swift
//  CometFall
//
//  Created by Keenan Sturtevant on 8/18/16.
//  Copyright © 2016 Keenan Sturtevant. All rights reserved.
//

import SpriteKit

class GameState: SKNode {
    
    var stateData = UserDefaults()
    var highScores = UserDefaults()
    var gameStateData = UserDefaults()
    
    func createGameState() {
        stateData.set(100, forKey: "playerHealth")
        stateData.set(false, forKey: "gameOver")
        stateData.set(false, forKey: "bossDead")
        stateData.set(1, forKey: "level")
        stateData.set(0, forKey: "score")
    }
    
    func saveGameState() -> NSDictionary {
        var gameData = NSDictionary()
        gameData = {[
                "score":"\(self.getScore())",
                "health":"\(self.getPlayerHealth())",
                "rockFallRate":"\(self.determineRockSpeed())",
                "rockSpawnRate":"\(self.determineRockSpawnSpeed())",
                "bossDead":"\(self.isBossDead())",
                "isGameOver()":"\(self.isGameOver())",
                "rockSpawnRate":"\(self.determineRockSpeed())",
                "controlType":"\(GameSettings().getControlType())",
                "difficulty":"\(GameSettings().getDifficulty())",
                "gameType":"\(GameSettings().getGameType())",
                "uuid":"\(UIDevice.current.identifierForVendor?.uuidString))"
            ]}()
        gameStateData.set(gameData, forKey: "thisSession")
        return gameData
    }
    
    func postGameState() {
        gameStateData.set(saveGameState(), forKey: "lastSession")
    }
    
    func getLastSessionData() -> Any {
        return gameStateData.object(forKey: "lastSession")!
    }
    
    func getHighScores() -> Any {
        return getScore()
    }
    
    func getLevel() -> Int {
        return stateData.object(forKey: "level") as! Int
    }
    
    func getPlayerHealth() -> Int {
        if let health = (stateData.object(forKey: "playerHealth")) {
            return health as! Int
        }
        return 0
    }
    
    func getScore() -> Int {
        if let score = (stateData.object(forKey: "score")) {
            return score as! Int
        }
        return 0
    }
    
    func toggleGameOver(_ value: Bool) {
        stateData.set(value, forKey: "gameOver")
    }
    
    func setPlayersHealth(_ value: Int) {
        stateData.set(value, forKey: "playerHealth")
    }
    
    func setScore(_ value: Int) {
        stateData.set(value, forKey: "score")
    }
    
    func isGameOver() -> Bool {
        return stateData.object(forKey: "gameOver") as! Bool
    }
    
    func isBossDead() -> Bool {
        return stateData.object(forKey: "bossDead") as! Bool
    }
    
    func determineRockSpeed() -> TimeInterval {
        let score = getScore()
        if score > 1500 {
            return 0.65
        } else if score > 1200 {
            return 0.67
        } else if score > 1000 {
            return 0.70
        } else if score > 800 {
            return 0.73
        } else if score > 600 {
            return 0.75
        } else if score > 400 {
            return 0.77
        } else if score > 200 {
            return 0.8
        } else {
            return 1.0
        }
    }
    
    func determineRockSpawnSpeed() -> TimeInterval {
        let score = getScore()
        if score > 1500 {
            return 0.2
        } else if score > 1200 {
            return 0.35
        } else if score > 1000 {
            return 0.4
        } else if score > 800 {
            return 0.45
        } else if score > 600 {
            return 0.5
        } else if score > 400 {
            return 0.55
        } else if score > 200 {
            return 0.6
        } else {
            return 0.8
        }
    }
    
    func postScore() {
//        let request = NSMutableURLRequest(url: URL(string: "http://localhost:3000/update_score")!)
//        request.httpMethod = "POST"
//        let postString = "uuid=\(UIDevice.current.identifierForVendor?.uuidString)&level=\(stateData.object(forKey: "level"))"
//        request.httpBody = postString.data(using: String.Encoding.utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard error == nil && data != nil else {
//                // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
//                // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//            
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8)
//            print("responseString = \(responseString)")
//        }
//        task.resume()
    }
    
    func postLocalScore() {
        
    }
}
