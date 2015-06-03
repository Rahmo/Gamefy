//
//  User.swift
//  Gamefy
//
//  Created by Abdulrahman on 2015-05-29.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    @NSManaged var address: String
    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var password: String
    @NSManaged var phone: String
    @NSManaged var userName: String
    @NSManaged var games: NSSet
    @NSManaged var interests: User2GamesType

}
