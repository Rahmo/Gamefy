//
//  User2GamesType.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-28.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation
import CoreData

@objc(User2GamesType)
class User2GamesType: NSManagedObject {

    @NSManaged var uid: NSNumber
    @NSManaged var gid: NSNumber

}
