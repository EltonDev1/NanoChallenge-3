//
//  CadMatViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 20/04/22.
//

import UIKit

class CadMatViewController: UIViewController {
    
    @IBOutlet weak var iptNameSubject: UITextField!
    
    //Setando uma variável como optional para receber um valor de outra viewController no futuro
    var id : Int64?
    
    var update : (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

            
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(saveNewSubject))
    }
    
    //Função que salva o que o usuário escreveu como uma nova matéria
    @objc func saveNewSubject() {
        
        //Transformando o input do usuário em uma string
        guard let txt = iptNameSubject.text, !txt.isEmpty else { return }
        
        //Criando uma variável auxiliar com o valor do id da classe IdSubjects para inserir na função createSubject
        let newId : Int64 = id!
        
        //Chamando a função para criar uma nova matéria
        Subjects().createSubject(name: txt, id: newId)
        
        //Utilizando função para atualizar tabela de matérias
        update?()
        
        //Voltando para a classe ViewController
        navigationController?.popViewController(animated: true)
    }


}
