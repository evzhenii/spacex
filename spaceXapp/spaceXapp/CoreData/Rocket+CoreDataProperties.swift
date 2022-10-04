//
//  Rocket+CoreDataProperties.swift
//  spaceXapp
//
//  Created by boockich mac on 04.10.2022.
//
//

import Foundation
import CoreData


extension Rocket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rocket> {
        return NSFetchRequest<Rocket>(entityName: "Rocket")
    }

    @NSManaged public var name: String?

}

extension Rocket : Identifiable {

}
