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
    @IBOutlet weak var vwButton: UIView!
    
    @IBOutlet weak var vwIptBtn: UIView!
    @IBOutlet weak var tbViewSubjects: UITableView!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var tituloLg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Setando o delegate e o dataSource da tabela para a própria classe.
        //É necessário adicionar o UITableViewDelegate e UITableViewData source na própria classe para satisfazer a variável.
        //Nesse caso seram criadas extensões da própria classe com as UIViews necessárias
        tbViewSubjects.delegate = self
        tbViewSubjects.dataSource = self

        //Setando borda para o input juntamente com o botao de adicionar
        vwIptBtn.clipsToBounds = true
        vwIptBtn.layer.cornerRadius = 10
        
        vwButton.clipsToBounds = true
        vwButton.layer.cornerRadius = 10
        vwButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        //Adicionando imagem de background para a view principal
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //Deixando a font do titulo com estilo bold
        tituloLg.font = UIFont.boldSystemFont(ofSize: 34)
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Deletar") { action, indexPath in
            //Começando as alterações dentro da tabela
            self.tbViewSubjects.beginUpdates()
            
            //Deletando item do core data
            Subjects().deleteSubject(item: subjects[indexPath.row])
            
            //Deletando item da tabela
            self.tbViewSubjects.deleteRows(at: [indexPath], with: .fade)
            
            //Buscando os itens novamente no core data
            subjects = Subjects().getAllSubjects()
            
            self.tbViewSubjects.endUpdates()
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Editar") { action, indexPath in
            //Criando a variável que popula a ViewController selecionada
            let entry = self.storyboard?.instantiateViewController(withIdentifier: "EditSubjectViewController") as! EditSubjectViewController
            
            //Populando as variáveis da nova viewController
            entry.disciplina = subjects[indexPath.row]
            
            //Criando função que atualiza os dados quando volta para a viewController principal
            entry.update = {
                subjects = Subjects().getAllSubjects()
                DispatchQueue.main.async {
                    self.tbViewSubjects.reloadData()
                }
            }
            
            //Determinando o tamanho que a tela vai aparecer para o usuário
            entry.sheetPresentationController?.detents = [.medium()]
            
            //Apresentando a nova viewController na viewController principal
            self.present(entry, animated: true, completion: nil)
        }
        edit.backgroundColor = .link
        return [delete, edit]
    }
    
}



//Na extensão UITableViewDataSource é obrigatório duas funções: a função que contem cellForRowAt e numbersOfRowsInSection
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Disciplinas adicionadas"
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

