//
//  Subjects+CoreDataProperties.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 20/04/22.
//
//

import Foundation
import CoreData


extension Subjects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subjects> {
        return NSFetchRequest<Subjects>(entityName: "Subjects")
    }

    @NSManaged public var name: String?
    @NSManaged public var idSubject: Int64

}

extension Subjects : Identifiable {

}
