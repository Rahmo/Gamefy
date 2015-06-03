//
//  UserModel.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    
    var address: String = String()
    var id: NSNumber  = NSNumber()
    var name: String  = String()
    var phone: String  = String()
    var userName: String  = String()
    var password: String  = String()
    var games: [GameModel] = [GameModel]()
    var interests: User2GamesTypeModel = User2GamesTypeModel()
    
}
