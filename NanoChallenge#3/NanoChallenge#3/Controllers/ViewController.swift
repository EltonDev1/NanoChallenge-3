//
//  ViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 13/04/22.
//

import UIKit

//Setando a array de todas classes coreData como global para ajudar no fluxo de desenvolvimento
var idSubject : [IdSubjects] = IdSubjects().getAllIdSubjects()
var subjects : [Subjects] = Subjects().getAllSubjects()
var classes : [Classes] = Classes().getAllClasses()

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var iptNewSubject: UITextField!
    
    @IBOutlet weak var tbViewSubjects: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Setando o delegate e o dataSource da tabela para a própria classe.
        //É necessário adicionar o UITableViewDelegate e UITableViewData source na própria classe para satisfazer a variável.
        //Nesse caso seram criadas extensões da própria classe com as UIViews necessárias
        tbViewSubjects.delegate = self
        tbViewSubjects.dataSource = self
        
        //Adicionando um botão de edição na navigationItem no canto direito
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: #selector(editCells))
    }
    
    @objc func editCells() {
        if tbViewSubjects.isEditing {
            tbViewSubjects.setEditing(false, animated: true)
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: #selector(editCells))
        } else {
            tbViewSubjects.setEditing(true, animated: true)
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pronto", style: .plain, target: self, action: #selector(editCells))
        }
    }

    @IBAction func adicionarMatéria(_ sender: Any) {
    
        guard let txt = iptNewSubject.text else { return }
        
        let newTxt = txt.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(newTxt != "") {
            //Condição para checar se existe algum objeto criado dentro da entidade IdSubject
            if idSubject.isEmpty {

                //Criando um novo id para a adicionar na entidade
                let newId : Int64 = 1

                //Adicionando id na entidade IdSubjects
                IdSubjects().createIdSubject(id: newId)
                
                //Chamando a função para criar uma nova matéria
                Subjects().createSubject(name: txt, id: newId)

            } else {
                //Criando uma nova id com o valor do id atual do IdSubjects + 1 (incrementação)
                let newId = idSubject[0].id + 1;

               //Deletando o id com o valor passadp
               IdSubjects().deleteAllIdsSubjects()

               idSubject = IdSubjects().getAllIdSubjects()

               if idSubject.isEmpty {
                   print("Deu certo");
               }

               //Inserindo um novo id com o valor incrementado
               IdSubjects().createIdSubject(id: newId)

               idSubject = IdSubjects().getAllIdSubjects()

               //Chamando a função para criar uma nova matéria
               Subjects().createSubject(name: newTxt, id: newId)


           }
            
            //Utilizando função para atualizar tabela de matérias
            subjects = Subjects().getAllSubjects()
            DispatchQueue.main.async {
                self.tbViewSubjects.reloadData()
            }
            
            iptNewSubject.text = ""
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(subjects[indexPath.row].idSubject)
        
        //Criando a variável que popula a ViewController selecionada
        let entry = storyboard?.instantiateViewController(withIdentifier: "ClassesViewController") as! ClassesViewController
        
        //Populando a ViewController com base nas variáveis opcionais criadas na mesma
        entry.nameSubject = subjects[indexPath.row].name
        entry.idSubject = subjects[indexPath.row].idSubject
        
        //Enviando o usuário para a ViewController selecionada junto com as variáveis setadas
        navigationController?.pushViewController(entry, animated: true)
        
        //Tirando o status de selecionado da linha
        tbViewSubjects.deselectRow(at: indexPath, animated: true)
    }
    
    //Funções utilizadas para que ao deslizar a linha, seja possível efetuar algumas ações como por exemplo apagar
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tbViewSubjects.beginUpdates()
            Subjects().deleteSubject(item: subjects[indexPath.row])
            tbViewSubjects.deleteRows(at: [indexPath], with: .fade)
            subjects = Subjects().getAllSubjects()
            tbViewSubjects.endUpdates()
        }
    }
    
}



//Na extensão UITableViewDataSource é obrigatório duas funções: a função que contem cellForRowAt e numbersOfRowsInSection
extension ViewController: UITableViewDataSource {
    
    //Função que cria um titulo para uma seção específica de células
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Matérias atuais"
            default:
                return ""
        }
            
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retornando a quantidade de itens na arrau subjects
        return subjects.count
    }
    
    //Função que seta os valores dos itens dentro da célula
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbViewSubjects.dequeueReusableCell(withIdentifier: "SubjectTableViewCell", for: indexPath) as! SubjectTableViewCell
        cell.lblSubject.text = subjects[indexPath.row].name
        return cell
    }
}

