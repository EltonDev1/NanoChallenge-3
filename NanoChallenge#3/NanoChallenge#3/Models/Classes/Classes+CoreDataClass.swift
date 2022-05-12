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
    
    func createClass(id: Int64, name: String, rate: String, obs: String?) {
        //trazendo o modelo da entidade para inserir
        let item = Classes(context: context)
        
        //Inserindo os valores do parâmetro aos atributos da entidade
        item.idClass = id
        item.nameClass = name
        item.rateClass = rate
        if obs != nil {
            item.obsClass = obs
        } else {
            item.obsClass = ""
        }
        
        //Salvando as alterações
        save()
    }
    
    func updateClass(name: String, rate: String, obs: String?, item: Classes) {
        //Utiliza a variável de objeto no parâmetro para modificar o mesmo, utilizando as outras variáveis como valor
        item.nameClass = name
        item.rateClass = rate
        item.obsClass = obs
        
        //Atualiza os dados
        save()
    }
    
    //Função para deletar uma aula em específico
    func deleteClass(item: Classes) {
        //É utilizado a função pronta delete, que pega um item em específico do context que trouxe todos dados da entidade e deleta
        context.delete(item)
        
        //Salvando as alterações
        save()
    }
    
    //Função criada para o processo de desenvolvimento, ajudando na rapidez da exclusao de todos dados
    func deleteAll() {
        let items : [Classes] = fetchAll()
        
        for item in items {
            context.delete(item)
            save()
        }
    }
    
    func fetchAll()->[Classes] {
        //Criando uma array do tipo Classes para armazenar todos itens armazenados na entidade
        var items : [Classes] = []
        
//        Classes.fetchRequest().sortDescriptors = [NSSortDescriptor(key: "rateClass", ascending: true), NSSortDescriptor(key: "nameClass", ascending: true)]
        
        do {
            //buscando todos itens da entidade e alocando na variável item
            items = try context.fetch(Classes.fetchRequest())
        } catch{}
        
        //Retornando a array com todos itens
        return items.sorted { (initial, next) -> Bool in return initial.nameClass!.compare(next.nameClass!) == .orderedAscending}
    }
    
    func getAllClasses()->[Classes] {
        //Chamando a função que retorna os itens da entidade e alocando em uma variável auxiliar
        let aux : [Classes] = fetchAll()
        
        //Criando a lista que vai alocar cada item da variável auxiliar
        var listClasses : [Classes] = []
        
        //Fazendo o forEach para cada item da variável auxiliar ser alocada dentro da listClasses
        for item in aux {
            listClasses.append(item)
        }
        
        //Retornando todos itens da classe
        return listClasses.sorted { (initial, next) -> Bool in return initial.rateClass!.compare(next.rateClass!) == .orderedDescending}
    }
    
    func getClassesById(id: Int64)->[Classes] {
        //Chamando a função que retorna os itens da entidade e alocando em uma variável auxiliar
        let aux : [Classes] = fetchAll()
        
        //Criando a lista que vai alocar cada item da variável auxiliar
        var listClasses : [Classes] = []
        
        //Fazendo o forEach para cada item da variável auxiliar que corresponde com a id ser alocada dentro da listClasses
        for item in aux {
            if(item.idClass == id) {
                listClasses.append(item)
            }
        }
        //Retornando todos itens da classe
        return listClasses.sorted { (initial, next) -> Bool in return initial.rateClass!.compare(next.rateClass!) == .orderedDescending}
    }

}
