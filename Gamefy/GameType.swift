//
//  GameType.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-28.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation
import CoreData

@objc(GameType)
class GameType: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var games: NSSet

}


