//
//  ClassesViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 25/04/22.
//

import UIKit



class ClassesViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tbViewClasses: UITableView!
    @IBOutlet weak var lblNameSubject: UILabel!
    
    //Variável que vai receber o id e nome da materia que for selecionado pelo usuário
    var idSubject : Int64?
    var nameSubject : String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Alterando a array classes com aulas que pertencem somente essa materia
        classes = Classes().getClassesById(id: self.idSubject!)
        
        //Criando um variavel para receber o nameSubject opcional e implementar no titulo
        let nameSub : String = nameSubject!

        //Atribuindo a variável nameSub ao titulo da pagina
        lblNameSubject.text = nameSub

        //Atribuindo delegate e datasource à tabela
        tbViewClasses.delegate = self
        tbViewClasses.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(adicionarNovaAula))
    }
    
    @objc func adicionarNovaAula() {
        //Criando uma variável que vai ter o valor da classe do storyboard de cadastro de novas aulas
        let entry = storyboard?.instantiateViewController(withIdentifier: "RegClassesViewController") as! RegClassesViewController
        
        entry.idSubject = self.idSubject!
        entry.update = {
            classes = Classes().getClassesById(id: self.idSubject!)
            DispatchQueue.main.async {
                self.tbViewClasses.reloadData()
            }
        }
        
        navigationController?.pushViewController(entry, animated: true)
        
    }
    
}

extension ClassesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = storyboard?.instantiateViewController(withIdentifier: "ViewAndEditViewController") as! ViewAndEditViewController
        
        entry.selectedButton = classes[indexPath.row].rateClass
        entry.observationOfTheme = classes[indexPath.row].obsClass
        entry.nameTheme = classes[indexPath.row].nameClass
        entry.classSelected = classes[indexPath.row]
        entry.update = {
            classes = Classes().getClassesById(id: self.idSubject!)
            DispatchQueue.main.async {
                self.tbViewClasses.reloadData()
            }
        }
        navigationController?.pushViewController(entry, animated: true)
        
        tbViewClasses.deselectRow(at: indexPath, animated: true)
    }
    
    //Funções utilizadas para que ao deslizar a linha, seja possível efetuar algumas ações como por exemplo apagar
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
          
            Classes().deleteClass(item: classes[indexPath.row])
            classes = Classes().getClassesById(id: self.idSubject!)
            DispatchQueue.main.async {
                self.tbViewClasses.reloadData()
            }
            
            
        }
    }
    
}

extension ClassesViewController: UITableViewDataSource {
    
    //Função que cria um titulo para uma seção específica de células
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Aulas adicionadas"
            default:
                return ""
        }
            
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retornando a quantidade de itens na arrau subjects
        return classes.count
    }
    
    //Função que seta os valores dos itens dentro da célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var rate : UIColor?
        
        switch classes[indexPath.row].rateClass {
            case "A":
                rate = UIColor.systemGreen
            break;
            case "B":
                rate = UIColor(red: 190/255, green: 223/255, blue: 0, alpha: 1)
            break;
            case "C":
                rate = UIColor.systemYellow
            break;
            case "D":
                rate = UIColor.systemOrange
            break;
            case "E":
                rate = UIColor.systemRed
            break;
            default:
                rate = UIColor.systemBlue
            break;
        }
        
        let cell = tbViewClasses.dequeueReusableCell(withIdentifier: "ClassesTableViewCell", for: indexPath) as! ClassesTableViewCell
        cell.lblClasses.text = classes[indexPath.row].nameClass
        cell.imgCircleBook.tintColor = rate
        return cell
    }
}
