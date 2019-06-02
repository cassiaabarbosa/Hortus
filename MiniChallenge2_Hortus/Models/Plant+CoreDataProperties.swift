//
//  Plant+CoreDataProperties.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 16/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var wateringInterval: String?
    @NSManaged public var wateringPeriod: Int32
    @NSManaged public var wateredTime: NSDate?
    @NSManaged public var nextWateringTime: NSDate?
    @NSManaged public var history: NSOrderedSet?

}

// MARK: Generated accessors for history
extension Plant {

    @objc(insertObject:inHistoryAtIndex:)
    @NSManaged public func insertIntoHistory(_ value: Log, at idx: Int)

    @objc(removeObjectFromHistoryAtIndex:)
    @NSManaged public func removeFromHistory(at idx: Int)

    @objc(insertHistory:atIndexes:)
    @NSManaged public func insertIntoHistory(_ values: [Log], at indexes: NSIndexSet)

    @objc(removeHistoryAtIndexes:)
    @NSManaged public func removeFromHistory(at indexes: NSIndexSet)

    @objc(replaceObjectInHistoryAtIndex:withObject:)
    @NSManaged public func replaceHistory(at idx: Int, with value: Log)

    @objc(replaceHistoryAtIndexes:withHistory:)
    @NSManaged public func replaceHistory(at indexes: NSIndexSet, with values: [Log])

    @objc(addHistoryObject:)
    @NSManaged public func addToHistory(_ value: Log)

    @objc(removeHistoryObject:)
    @NSManaged public func removeFromHistory(_ value: Log)

    @objc(addHistory:)
    @NSManaged public func addToHistory(_ values: NSOrderedSet)

    @objc(removeHistory:)
    @NSManaged public func removeFromHistory(_ values: NSOrderedSet)

}
