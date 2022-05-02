//
//  Pessoa+CoreDataProperties.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 28/04/22.
//
//

import Foundation
import CoreData


extension Pessoa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pessoa> {
        return NSFetchRequest<Pessoa>(entityName: "Pessoa")
    }

    @NSManaged public var nome: String?

}

extension Pessoa : Identifiable {

}
