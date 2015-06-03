//
//  Game.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-28.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation
import CoreData

@objc(Game)
class Game: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var location: String
    @NSManaged var name: String
    @NSManaged var spots: NSNumber
    @NSManaged var gametype: GameType
    @NSManaged var user: User

}


