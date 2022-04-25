//
//  Classes+CoreDataClass.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 25/04/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(Classes)
public class Classes: NSManagedObject {
    
    //Variável de intermediação dos dados persistentes da entidade com as funções criadas
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //função que salva as alterações feitas
    private func save() {
        do {
            try context.save()
        } catch{}
    }
    
    func createClass(id: Int64, name: String, rate: String, obs: String) {
        //trazendo o modelo da entidade para inserir
        let item = Classes(context: context)
        
        //Inserindo os valores do parâmetro aos atributos da entidade
        item.idClass = id
        item.nameClass = name
        item.rateClass = rate
        item.obsClass = obs
        
        //Salvando as alterações
        save()
    }

}
