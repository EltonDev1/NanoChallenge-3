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

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(saveNewSubject))
    }
    
    @objc func saveNewSubject() {
        
        guard let txt = iptNameSubject.text, !txt.isEmpty else { return }
        
        let newId : Int64 = id!
        
        Subjects().createSubject(name: txt, id: newId)
        
        navigationController?.popViewController(animated: true)
    }


}
