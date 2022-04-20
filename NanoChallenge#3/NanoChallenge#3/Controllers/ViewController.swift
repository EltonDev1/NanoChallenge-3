//
//  ViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 13/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ola")
    }


    @IBAction func adicionarNovaMateria(_ sender: Any) {
        let entry = storyboard?.instantiateViewController(withIdentifier: "CadMatViewController") as! CadMatViewController
        
        //Condição para checar se existe algum objeto criado dentro da entidade IdSubject
        if IdSubjects().getAllIdSubjects().isEmpty {
            
            //Criando um novo id para a adicionar na entidade
            let newId : Int64 = 1
            
            //Adicionando id na entidade IdSubjects
            IdSubjects().createIdSubject(id: newId)
            
            //Setando o valor do id à variavel
            entry.id = newId
        } else {
            //Criando uma variável que vai receber uma lista de objetos IdSubjects
            let idSubObject = IdSubjects().getAllIdSubjects()
            
            //Criando uma nova id com o valor do id atual do IdSubjects + 1 (incrementação)
            let newId = idSubObject[0].id + 1;
            
            //Deletando o id com o valor passadp
            IdSubjects().deleteIdSubject(item: idSubObject[0])
            
            //Inserindo um novo id com o valor incrementado
            IdSubjects().createIdSubject(id: newId)
            
            //Setando o valor do id à variavel
            entry.id = newId
     
        }
        
        //Navegação sendo feita
        navigationController?.pushViewController(entry, animated: true)
    }
    
    
}

