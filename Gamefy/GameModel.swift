//
//  GameModel.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation

class GameModel: NSObject {
    
    var id: NSNumber = NSNumber()
    var location: String = String()
    var name: String = String()
    var spots: NSNumber = NSNumber()
    var gametype: GameType = GameType()
    var user: UserModel = UserModel()
    
}
