//
//  Pessoa+CoreDataClass.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 28/04/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(Pessoa)
public class Pessoa: NSManagedObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func save() {
        do {
            try context.save()
        } catch{}
    }
    
    func createPessoa(nome: String) {
        let item = Pessoa(context: context)
        
        item.nome = nome
        
        save()
    }
}
