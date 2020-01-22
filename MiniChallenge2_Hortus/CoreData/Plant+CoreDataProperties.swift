//
//  Plant+CoreDataProperties.swift
//  MiniChallenge2_Hortus
//
//  Created by Cassia Aparecida Barbosa on 21/01/20.
//  Copyright © 2020 Hortus. All rights reserved.
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
    @NSManaged public var nextWateringTime: Date?
    @NSManaged public var wateredTime: Date?
    @NSManaged public var wateringInterval: String?
    @NSManaged public var wateringPeriod: Int32
    @NSManaged public var harvestingPeriod: Int32
    @NSManaged public var harvestTime: Date?
    @NSManaged public var nextHarvestingTime: Date?
    @NSManaged public var floweringPeriod: Int32
    @NSManaged public var floweringTime: Date?
    @NSManaged public var nextFloweringTime: Date?
    @NSManaged public var sunExposurePeriod: Int32
    @NSManaged public var sunExposureTime: Date?
    @NSManaged public var nextSunExposureTime: Date?
    @NSManaged public var fertilizingPeriod: Int32
    @NSManaged public var fertilizingTime: Date?
    @NSManaged public var nextFertilizingTime: Date?
    @NSManaged public var pesticidePeriod: Int32
    @NSManaged public var pesticideTime: Date?
    @NSManaged public var nextPesticideTime: Date?
    @NSManaged public var pruningPeriod: Int32
    @NSManaged public var pruningTime: Date?
    @NSManaged public var nextPruningTime: Date?

}
