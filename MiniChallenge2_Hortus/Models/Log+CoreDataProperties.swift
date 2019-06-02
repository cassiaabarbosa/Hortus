//
//  Log+CoreDataProperties.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 16/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//
//

import Foundation
import CoreData


extension Log {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }

    @NSManaged public var action: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var plant: Plant?

}
