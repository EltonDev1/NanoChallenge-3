//
//  ClassesViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 25/04/22.
//

import UIKit

class ClassesViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var iptNewClass: UITextField!
    @IBOutlet weak var tbViewClasses: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Atribuindo delegate e datasource à tabela
        tbViewClasses.delegate = self
        tbViewClasses.dataSource = self
    }

    //Função para adicionar uma nova aula a entidade Classes e carregar na tabela
    @IBAction func adicionarNovaAula(_ sender: Any) {
    }
    
}

extension ClassesViewController: UITableViewDelegate {
    
}

extension ClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
