//
//  EditSubjectViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 11/05/22.
//

import UIKit

class EditSubjectViewController: UIViewController {
    
    //Criando variáveis/funções opcionais que auxiliarão na edição das informações no coreData
    var disciplina : Subjects?
    var update : (() -> Void)?
    
    //Variavel input
    @IBOutlet weak var txtFldAlterar: UITextField!
    
    //Criando a navigationBar para utilizar as funções de salvar e voltar para outra ViewController
    var navBar : UINavigationBar = .init()
    
    //Criando variável do tipo navigationItem que auxiliará na criação de novos botões
    var navItem : UINavigationItem = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pre setando o texto do input como o nome da disciplina atual
        txtFldAlterar.text = disciplina?.name
        
        //Desativando propriedade que permite utilizar constraint nesses objeto em específico
        navBar.translatesAutoresizingMaskIntoConstraints = false
        txtFldAlterar.translatesAutoresizingMaskIntoConstraints = false
        
        //Injetando a navigationBar dentro da view principal
        [navBar].forEach { view.addSubview($0) }
        
        //Criando os botões e setando suas funções
        navItem.rightBarButtonItem = .init(title: "Salvar", style: .done, target: self, action: #selector(salvarDisciplina))
        navItem.leftBarButtonItem = .init(title: "Voltar", style: .plain , target: self, action: #selector(sairViewController))
        
        //setando um titulo para a página
        navItem.title = "Editar Disciplina"
        
        //Adicionando as constraints aos objetos
        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        txtFldAlterar.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0).top).isActive = true
        txtFldAlterar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0).left).isActive = true
        txtFldAlterar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15).right).isActive = true
        
        
        //Injetando os botões criados dentro da navigationBar
        navBar.setItems([navItem], animated: true)
        
    }
    
    //Chamando a função setada no botão de salvar o conteudo
    @objc func salvarDisciplina() {
        
        //Transformando o texto do input em uma string
        guard let txt = txtFldAlterar.text else { return }
        
        //Certificando que o usuário não vai alterar para uma string vazia ou vazia somente com espaços
        let newTxt = txt.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if newTxt != "" {
            //Utilizando função que altera os dados no core data
            Subjects().updateSubject(name: newTxt, id: disciplina!.idSubject, item: disciplina!)
            
            //Chamando a função que atualiza os dados da tabela
            update?()
            
            //Função que faz voltar para viewController principal
            dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    //Chamando a função setada no botão de voltar para a outra viewController
    @objc func sairViewController() {
        
        //Função que faz voltar para viewController principal
        dismiss(animated: true, completion: nil)
    }
    

 
}
