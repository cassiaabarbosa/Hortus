//
//  Plant+CoreDataProperties.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 26/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var plantImage: String?
    @NSManaged public var plantName: String?
    @NSManaged public var floweringInterval: String?
    @NSManaged public var floweringPeriod: Int32
    @NSManaged public var floweringLastDate: Date?
    @NSManaged public var floweringNextDate: Date?
    @NSManaged public var harvestingInterval: String?
    @NSManaged public var harvestingPeriod: Int32
    @NSManaged public var harvestingLastDate: Date?
    @NSManaged public var harvestingNextDate: Date?
    @NSManaged public var sunExposureInterval: String?
    @NSManaged public var sunExposurePeriod: Int32
    @NSManaged public var sunExposureLastDate: Date?
    @NSManaged public var sunExposureNextDate: Date?
    @NSManaged public var boosterInterval: String?
    @NSManaged public var boosterPeriod: Int32
    @NSManaged public var boosterLastDate: Date?
    @NSManaged public var boosterNextDate: Date?
    @NSManaged public var wateringInterval: String?
    @NSManaged public var wateringPeriod: Int32
    @NSManaged public var wateringLastDate: Date?
    @NSManaged public var wateringNextDate: Date?
    @NSManaged public var pruningInterval: String?
    @NSManaged public var pesticideInterval: String?
    @NSManaged public var pesticidePeriod: Int32
    @NSManaged public var pruningPeriod: Int32
    @NSManaged public var pruningLastDate: Date?
    @NSManaged public var pruningNextDate: Date?
    @NSManaged public var pesticideNextDate: Date?
    @NSManaged public var pesticideLastDate: Date?

}
