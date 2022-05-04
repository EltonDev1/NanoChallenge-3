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
    
    //Conectando todos botoes para fazer modificações
    @IBOutlet weak var btnMuitoBom: UIButton!
    @IBOutlet weak var btnBom: UIButton!
    @IBOutlet weak var btnRazoavel: UIButton!
    @IBOutlet weak var btnPouco: UIButton!
    @IBOutlet weak var btnMuitoPouco: UIButton!
    
    
    @IBAction func avMuitoBom(_ sender: Any) {
        if btnMuitoBom.layer.borderWidth == 0 {
            btnMuitoBom.layer.borderWidth = 1
            btnMuitoBom.layer.borderColor = UIColor.white.cgColor
            btnMuitoBom.layer.opacity = 1
            btnMuitoBom.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = "MB"
            
            //Retirando a borda de cada botão caso tenha
            btnBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnBom.layer.opacity = 0.5
            btnRazoavel.layer.opacity = 0.5
            btnPouco.layer.opacity = 0.5
            btnMuitoPouco.layer.opacity = 0.5
        } else {
            btnMuitoBom.layer.opacity = 0.5
            btnMuitoBom.layer.borderWidth = 0
            selectedButton = ""
        }
    }
    @IBAction func avBom(_ sender: Any) {
        
        if btnBom.layer.borderWidth == 0 {
            btnBom.layer.borderWidth = 1
            btnBom.layer.borderColor = UIColor.white.cgColor
            btnBom.layer.opacity = 1
            btnBom.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = "MB"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.5
            btnRazoavel.layer.opacity = 0.5
            btnPouco.layer.opacity = 0.5
            btnMuitoPouco.layer.opacity = 0.5
        } else {
            btnBom.layer.opacity = 0.5
            btnBom.layer.borderWidth = 0
            selectedButton = ""
        }
    }
    @IBAction func avRazoavel(_ sender: Any) {
        if btnRazoavel.layer.borderWidth == 0 {
            btnRazoavel.layer.borderWidth = 1
            btnRazoavel.layer.borderColor = UIColor.white.cgColor
            btnRazoavel.layer.opacity = 1
            btnRazoavel.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = "MB"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.5
            btnBom.layer.opacity = 0.5
            btnPouco.layer.opacity = 0.5
            btnMuitoPouco.layer.opacity = 0.5
        } else {
            btnRazoavel.layer.opacity = 0.5
            btnRazoavel.layer.borderWidth = 0
            selectedButton = ""
        }
    }
    @IBAction func avPouco(_ sender: Any) {
        if btnPouco.layer.borderWidth == 0 {
            btnPouco.layer.borderWidth = 1
            btnPouco.layer.borderColor = UIColor.white.cgColor
            btnPouco.layer.opacity = 1
            btnPouco.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = "MB"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.5
            btnBom.layer.opacity = 0.5
            btnRazoavel.layer.opacity = 0.5
            btnMuitoPouco.layer.opacity = 0.5
        } else {
            btnPouco.layer.opacity = 0.5
            btnPouco.layer.borderWidth = 0
            selectedButton = ""
        }
    }
    @IBAction func avMuitoPouco(_ sender: Any) {
        if btnMuitoPouco.layer.borderWidth == 0 {
            btnMuitoPouco.layer.borderWidth = 1
            btnMuitoPouco.layer.borderColor = UIColor.white.cgColor
            btnMuitoPouco.layer.opacity = 1
            btnMuitoPouco.layer.cornerRadius = 5
            
            //Setando o nome para a variável de cadastro
            selectedButton = "MB"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.5
            btnBom.layer.opacity = 0.5
            btnRazoavel.layer.opacity = 0.5
            btnPouco.layer.opacity = 0.5
        } else {
            btnMuitoPouco.layer.opacity = 0.5
            btnMuitoPouco.layer.borderWidth = 0
            selectedButton = ""
        }
    }
    
    var nameTheme : String?
    var selectedButton : String?
    var observationOfTheme : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtObservation.layer.borderColor = UIColor.lightGray.cgColor
        txtObservation.layer.borderWidth = 0.25
        txtObservation.layer.cornerRadius = 10
        
        //Pre setando a opacidade dos botões
        btnMuitoBom.layer.opacity = 0.5
        btnBom.layer.opacity = 0.5
        btnRazoavel.layer.opacity = 0.5
        btnPouco.layer.opacity = 0.5
        btnMuitoPouco.layer.opacity = 0.5
        
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
            case "MB":
                btnMuitoBom.layer.opacity = 1
            break;
            case "B":
                btnBom.layer.opacity = 1
            break;
            case "R":
                btnRazoavel.layer.opacity = 1
            break;
            case "P":
                btnPouco.layer.opacity = 1
            break;
            case "MP":
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

    }

}
