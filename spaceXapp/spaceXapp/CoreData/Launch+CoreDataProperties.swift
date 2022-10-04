//
//  Launch+CoreDataProperties.swift
//  spaceXapp
//
//  Created by boockich mac on 04.10.2022.
//
//

import Foundation
import CoreData


extension Launch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Launch> {
        return NSFetchRequest<Launch>(entityName: "Launch")
    }


}

extension Launch : Identifiable {

}
