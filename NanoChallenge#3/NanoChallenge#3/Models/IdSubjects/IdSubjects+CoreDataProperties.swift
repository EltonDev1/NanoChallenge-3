//
//  IdSubjects+CoreDataProperties.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 20/04/22.
//
//

import Foundation
import CoreData


extension IdSubjects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IdSubjects> {
        return NSFetchRequest<IdSubjects>(entityName: "IdSubjects")
    }

    @NSManaged public var id: Int64

}

extension IdSubjects : Identifiable {

}
