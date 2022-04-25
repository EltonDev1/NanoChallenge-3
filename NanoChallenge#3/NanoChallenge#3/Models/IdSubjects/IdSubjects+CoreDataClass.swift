//
//  IdSubjects+CoreDataClass.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 20/04/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(IdSubjects)
public class IdSubjects: NSManagedObject {
    
    //Variável de intermediação dos dados persistentes da entidade com as funções criadas
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func save() {
        do {
            //Atualiza os dados da entidade na aplicação
            try context.save()
        } catch {}
    }
    
    func createIdSubject(id: Int64) {
        //Cria um modelo do objeto para inserção dos dados
        let item = IdSubjects(context: context)
        
        //Inserindo o valor do parâmetro dentro da variavel id da entidade
        item.id = id
     
        //atualiza os dados
        save()
    }
    
    func deleteIdSubject(item: IdSubjects) {
        //Deleta o objeto específico selecionado
        context.delete(item)
        //atualiza os dados
        save()
    }
    
    func deleteAllIdsSubjects() {
        //Busca todos dados da entidade
        let aux = fetchAll()
        
        //Apaga cada item armazenado na entidade
        for item in aux {
            context.delete(item)
        }
        
        //atualiza os dados
        save()
    }
    
    func fetchAll()->[IdSubjects] {
        //Cria uma array de itens do tipo IdSubject para armazenar as informações da própria entidade
        var items : [IdSubjects] = []
        
        do {
            //Busca os dados da entidade para poder setar valores em um item específico da array
            items = try context.fetch(IdSubjects.fetchRequest())
        } catch {}
        //Retorna a array com todos os itens dentro
        return items
    }
    
    func getAllIdSubjects()->[IdSubjects] {
        //Atribui o retorno da função fetchAll() com todos itens da entidade na variável auxiliar
        let aux = fetchAll()
        
        //Cria uma lista de objetos do tipo IdSubject
        var lista : [IdSubjects] = []
        
        //Percorre todos itens da variável auxiliar e atribui na lista de objetos do tipo IdSubject
        for item in aux {
            lista.append(item)
        }
        
        //Retorna a lista para a variável que chamou a função
        return lista
    }

}
