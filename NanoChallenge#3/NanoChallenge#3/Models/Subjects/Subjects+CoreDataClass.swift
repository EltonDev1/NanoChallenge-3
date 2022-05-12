//
//  Subjects+CoreDataClass.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 20/04/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(Subjects)
public class Subjects: NSManagedObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func save() {
        do {
            //Atualiza os dados da entidade na aplicação
            try context.save()
        } catch {}
    }
    
    func createSubject(name: String, id: Int64) {
        let item = Subjects(context: context)
        
        //Inserindo os valores dos parâmetros dentro das variaveis name e id da entidade
        item.name = name
        item.idSubject = id

        //atualiza os dados
        save()
    }
    
    func deleteSubject(item: Subjects) {
        //Apagando o objeto com base no item selecionado para o parâmetro
        context.delete(item)
        //atualiza os dados
        save()
    }
    
    func updateSubject(name: String, id: Int64, item: Subjects) {
        //Utiliza a variável de objeto no parâmetro para modificar o mesmo, utilizando as outras variáveis como valor
        item.name = name
        item.idSubject = id
        //atualiza os dados
        save()
    }
    
    func fetchAll()->[Subjects] {
        //Cria uma array de itens do tipo IdSubject para armazenar as informações da própria entidade
        var items : [Subjects] = []
        
        do {
            //Busca os dados da entidade para poder setar valores em um item específico da array
            items = try context.fetch(Subjects.fetchRequest())
        } catch {}
        //Retorna a array com todos os itens dentro
        return items
    }
    
    func getAllSubjects()->[Subjects] {
        //Atribui o retorno da função fetchAll() com todos itens da entidade na variável auxiliar
        let aux = fetchAll()
        
        //Cria uma lista de objetos do tipo IdSubject
        var lista : [Subjects] = []
        
        //Percorre todos itens da variável auxiliar e atribui na lista de objetos do tipo IdSubject
        for item in aux {
            lista.append(item)
        }
        
        //Retorna a lista para a variável que chamou a função
        return lista.sorted { (initial, next) -> Bool in return initial.name!.compare(next.name!) == .orderedAscending}
    }
    
    
    
    

}
