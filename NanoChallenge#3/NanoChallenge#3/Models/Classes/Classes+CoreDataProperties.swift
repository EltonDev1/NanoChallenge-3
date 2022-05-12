//
//  Classes+CoreDataProperties.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 25/04/22.
//
//

import Foundation
import CoreData


extension Classes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Classes> {
        return NSFetchRequest<Classes>(entityName: "Classes")
    }

    @NSManaged public var nameClass: String?
    @NSManaged public var idClass: Int64
    @NSManaged public var rateClass: String?
    @NSManaged public var obsClass: String?

}

extension Classes : Identifiable {

}
