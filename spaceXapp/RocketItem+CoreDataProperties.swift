//
//  RocketItem+CoreDataProperties.swift
//  spaceXapp
//
//  Created by boockich mac on 04.10.2022.
//
//

import Foundation
import CoreData


extension RocketItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RocketItem> {
        return NSFetchRequest<RocketItem>(entityName: "RocketItem")
    }

    @NSManaged public var name: String?

}

extension RocketItem : Identifiable {

}
