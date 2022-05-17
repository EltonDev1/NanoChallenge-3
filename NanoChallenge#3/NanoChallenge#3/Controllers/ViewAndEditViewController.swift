//
//  ViewAndEditViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 04/05/22.
//

import UIKit

class ViewAndEditViewController: UIViewController {
    
    //Campos de textos conectados para que possamos ja pre setar o valor dos mesmos
    @IBOutlet weak var txtNameTheme: UITextField!
    @IBOutlet weak var txtObservation: UITextView!
    
    var nameTheme : String?
    var selectedButton : String?
    var observationOfTheme : String?
    var classSelected : Classes?
    var update : (() -> Void)?
    
    //Conectando todos botoes para fazer modificações
    @IBOutlet weak var btnMuitoBom: UIButton!
    @IBOutlet weak var btnBom: UIButton!
    @IBOutlet weak var btnRazoavel: UIButton!
    @IBOutlet weak var btnPouco: UIButton!
    @IBOutlet weak var btnMuitoPouco: UIButton!
    
    func btnClicked(btnPrincipal: UIButton, btn1: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton, slctBtn: String) {
        if btnPrincipal.layer.borderWidth == 0 {
            btnPrincipal.layer.borderWidth = 0.01
            btnPrincipal.layer.borderColor = UIColor.white.cgColor
            btnPrincipal.layer.opacity = 1
            btnPrincipal.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = slctBtn
            
            //Retirando a borda de cada botão caso tenha
            btn1.layer.borderWidth = 0
            btn2.layer.borderWidth = 0
            btn3.layer.borderWidth = 0
            btn4.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btn1.layer.opacity = 0.3
            btn2.layer.opacity = 0.3
            btn3.layer.opacity = 0.3
            btn4.layer.opacity = 0.3
        } else {
            btnPrincipal.layer.borderWidth = 0
        }
    }
    
    
    @IBAction func avMuitoBom(_ sender: Any) {
        self.btnClicked(btnPrincipal: btnMuitoBom, btn1: btnBom, btn2: btnRazoavel, btn3: btnPouco, btn4: btnMuitoPouco, slctBtn: "A")
    }
    @IBAction func avBom(_ sender: Any) {
        self.btnClicked(btnPrincipal: btnBom, btn1: btnMuitoBom, btn2: btnRazoavel, btn3: btnPouco, btn4: btnMuitoPouco, slctBtn: "B")
    }
    @IBAction func avRazoavel(_ sender: Any) {
        self.btnClicked(btnPrincipal: btnRazoavel, btn1: btnMuitoBom, btn2: btnBom, btn3: btnPouco, btn4: btnMuitoPouco, slctBtn: "C")
    }
    @IBAction func avPouco(_ sender: Any) {
        self.btnClicked(btnPrincipal: btnPouco, btn1: btnMuitoBom, btn2: btnBom, btn3: btnRazoavel, btn4: btnMuitoPouco, slctBtn: "D")
    }
    @IBAction func avMuitoPouco(_ sender: Any) {
        self.btnClicked(btnPrincipal: btnMuitoPouco, btn1: btnMuitoBom, btn2: btnBom, btn3: btnRazoavel, btn4: btnPouco, slctBtn: "E")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Estilizando o objeto de anotações
        txtObservation.layer.borderColor = UIColor.lightGray.cgColor
        txtObservation.layer.borderWidth = 0.25
        txtObservation.layer.cornerRadius = 10
        
        //Pre setando a opacidade dos botões
        btnMuitoBom.layer.opacity = 0.3
        btnBom.layer.opacity = 0.3
        btnRazoavel.layer.opacity = 0.3
        btnPouco.layer.opacity = 0.3
        btnMuitoPouco.layer.opacity = 0.3
        
        //Logica da implementação de deixar pre setado qual foi a avaliação do usuário
        let selectedBtn = selectedButton!
        var confirmedBtn : String = ""
        //Foi feito um for para percorrer o vetor de objetos e comparar se a avaliação do objeto no indice é igual à avaliação ja pre setada no codigo
        for newClass : Classes in Classes().getAllClasses() {
            if newClass.rateClass == selectedBtn {
                confirmedBtn = newClass.rateClass!
            }
        }
        
        //For que verifica se é igual a chave de algum botao e deixa esse botao em especifico com 100% de opacidade
        switch confirmedBtn {
            case "A":
                btnMuitoBom.layer.opacity = 1
            break;
            case "B":
                btnBom.layer.opacity = 1
            break;
            case "C":
                btnRazoavel.layer.opacity = 1
            break;
            case "D":
                btnPouco.layer.opacity = 1
            break;
            case "E":
                btnMuitoPouco.layer.opacity = 1
            break;
            default:
            break;
        }
        
        
        //Criando variáveis que vão fazer com as informações vindas da outra página deixem de ser opcionais
        let txtNameThem = nameTheme!
        let txtObservatio = observationOfTheme!
        
        
        //Pre setando os campos de textos
        txtNameTheme.text = txtNameThem
        txtObservation.text = txtObservatio
        
        //Criando um botao no navigationItem com a função de salvar o que foi alterado
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(alterarDadosAula))

    }
    
    @objc func alterarDadosAula() {
        
        guard let newNameTheme = txtNameTheme.text else {return}
        guard let newObservationOfTheme = txtObservation.text else {return}
        
        let newSelectedButton = selectedButton!
        let newClassSelected = classSelected!

        let newTxtNameTheme = newNameTheme.trimmingCharacters(in: .whitespacesAndNewlines)

        let newTxtObservation = newObservationOfTheme.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if newTxtNameTheme != "" && newSelectedButton != ""{
            Classes().updateClass(name: newTxtNameTheme, rate: newSelectedButton, obs: newTxtObservation, item: newClassSelected)
            update?()
            navigationController?.popViewController(animated: true)
        } else {
            //Criando um alert com a função okay de fazer o alert desaparecer
            let alert = UIAlertController(title: "Erro", message: "Os dados estão incompletos, preencha-os corretamente.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }

}
