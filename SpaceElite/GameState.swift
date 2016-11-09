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
        stateData.set(0, forKey: "flightTime")
        stateData.set(0, forKey: "score")
        stateData.set(100, forKey: "playerHealth")
        stateData.set(1.0, forKey: "rockSpeed")
        stateData.set(0.8, forKey: "rockSpawnRate")
        stateData.set(false, forKey: "gameOver")
        stateData.set(false, forKey: "bossDead")
        stateData.set(1, forKey: "level")
    }
    
    func saveGameState() -> NSDictionary {
        var gameData = NSDictionary()
        gameData = {[
//                "userShip":"\(self.getUserShip())",
                "flightTime":"\(self.getFlightTime())",
                "score":"\(self.getScore())",
                "health":"\(self.getPlayerHealth())",
                "rockFallRate":"\(self.determineRockSpeed())",
                "rockSpawnRate":"\(self.determineRockSpawnSpeed())",
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
    
    func getGameState() -> Any {
        if let session = gameStateData.object(forKey: "thisSession") {
            return session
        }
        self.saveGameState()
        return self.getGameState()
    }
    
    func getLastGameState() -> Any {
        if let session = gameStateData.object(forKey: "lastSession") {
            return session
        }
        self.postGameState()
        return self.getLastGameState()
    }
    
    func getFlightTime() -> Int {
        if let time = (stateData.object(forKey: "flightTime")) {
            return time as! Int
        }
        return 0
    }
    
    func setFlightTime(time: Int) {
        stateData.set(time, forKey: "flightTime")
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
    
    func setUserShip(value: String) {
        stateData.set(value, forKey: "userShip")
    }
    
//    func getUserShip() -> Any {
//        if let shipName = (stateData.object(forKey: "userShip")) {
//            let ship = Ships(ChooseShipScene: ChooseShipScene(fileNamed: "ChooseShipScene")!).perform(shipName as! Selector)
//            return ship
//        } else {
//            let ship = Ships(ChooseShipScene: ChooseShipScene(fileNamed: "ChooseShipScene")!).defaultShip()
//            setUserShip(value: ship.name!)
//        }
//        return self.getUserShip()
//    }
    
    func isGameOver() -> Bool {
        if let gameOver = (stateData.object(forKey: "gameOver")) {
            return gameOver as! Bool
        }
        self.toggleGameOver(false)
        return self.isGameOver()
    }
    
    func determineRockSpeed() -> TimeInterval {
        let score = getScore()
        if score > 1500 {
            log.verbose("new rock speed rate")
            return 0.68
        } else if score > 1200 {
            log.verbose("new rock speed rate")
            return 0.70
        } else if score > 1000 {
            log.verbose("new rock speed rate")
            return 0.72
        } else if score > 800 {
            log.verbose("new rock speed rate")
            return 0.74
        } else if score > 600 {
            log.verbose("new rock speed rate")
            return 0.76
        } else if score > 400 {
            log.verbose("new rock speed rate")
            return 0.78
        } else if score > 200 {
            log.verbose("new rock speed rate")
            return 0.8
        } else {
            return 1.0
        }
    }
    
    func determineRockSpawnSpeed() -> TimeInterval {
        let time = self.getFlightTime()
        if time > 150 {
            log.verbose("new rock spawn rate")
            return 0.2
        } else if time > 90 {
            log.verbose("new rock spawn rate")
            return 0.35
        } else if time > 60 {
            log.verbose("new rock spawn rate")
            return 0.4
        } else if time > 40 {
            log.verbose("new rock spawn rate")
            return 0.45
        } else if time > 30 {
            log.verbose("new rock spawn rate")
            return 0.5
        } else if time > 20 {
            log.verbose("new rock spawn rate")
            return 0.55
        } else if time > 10 {
            log.verbose("new rock spawn rate")
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
