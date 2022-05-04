//
//  RegClassesViewController.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 28/04/22.
//

import UIKit

class RegClassesViewController: UIViewController {
    
    @IBOutlet weak var NavBarItems: UINavigationItem!
    @IBOutlet weak var txtViewAnotacoes: UITextView!
    @IBOutlet weak var txtNameTheme: UITextField!
    
    //Criando variaveis opcionais que viram da outra tela
    var idSubject : Int64?
    var update : (() -> Void)?
    
    //Conectando os botões a estas variaveis
    @IBOutlet weak var btnMuitoBom: UIButton!
    @IBOutlet weak var btnBom: UIButton!
    @IBOutlet weak var btnRazoavel: UIButton!
    @IBOutlet weak var btnPouco: UIButton!
    @IBOutlet weak var btnMuitoPouco: UIButton!
    
    //Criando varíavel que vai guardar o nome do botao que for apertado
    var selectedButton : String = ""
    
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
            btnBom.layer.opacity = 0.3
            btnRazoavel.layer.opacity = 0.3
            btnPouco.layer.opacity = 0.3
            btnMuitoPouco.layer.opacity = 0.3
        } else {
            btnMuitoBom.layer.opacity = 0.3
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
            selectedButton = "B"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.3
            btnRazoavel.layer.opacity = 0.3
            btnPouco.layer.opacity = 0.3
            btnMuitoPouco.layer.opacity = 0.3
        } else {
            btnBom.layer.borderWidth = 0
            btnBom.layer.opacity = 0.3
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
            selectedButton = "R"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.3
            btnBom.layer.opacity = 0.3
            btnPouco.layer.opacity = 0.3
            btnMuitoPouco.layer.opacity = 0.3
        } else {
            btnRazoavel.layer.borderWidth = 0
            btnRazoavel.layer.opacity = 0.3
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
            selectedButton = "P"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnMuitoPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.3
            btnBom.layer.opacity = 0.3
            btnRazoavel.layer.opacity = 0.3
            btnMuitoPouco.layer.opacity = 0.3
        } else {
            btnPouco.layer.borderWidth = 0
            btnPouco.layer.opacity = 0.3
            selectedButton = ""
        }
    }
    
    
    @IBAction func avMuitoPouco(_ sender: Any) {
        if btnMuitoPouco.layer.borderWidth == 0 {
            btnMuitoPouco.layer.borderWidth = 1
            btnMuitoPouco.layer.borderColor = UIColor.white.cgColor
            btnMuitoPouco.layer.opacity = 1
            btnMuitoPouco.layer.cornerRadius = 5
            
            selectedButton = "MP"
            
            //Retirando a borda de cada botão caso tenha
            btnMuitoBom.layer.borderWidth = 0
            btnBom.layer.borderWidth = 0
            btnRazoavel.layer.borderWidth = 0
            btnPouco.layer.borderWidth = 0
            
            //Deixando os outros botões com opacidade padrão novamente
            btnMuitoBom.layer.opacity = 0.3
            btnBom.layer.opacity = 0.3
            btnRazoavel.layer.opacity = 0.3
            btnPouco.layer.opacity = 0.3
        } else {
            btnMuitoPouco.layer.borderWidth = 0
            btnMuitoPouco.layer.opacity = 0.3
            selectedButton = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //deixando a opacidade de todos botões na metade no inicio do programa
        btnMuitoBom.layer.opacity = 1
        btnBom.layer.opacity = 1
        btnRazoavel.layer.opacity = 1
        btnPouco.layer.opacity = 1
        btnMuitoPouco.layer.opacity = 1
        
        txtViewAnotacoes.layer.borderColor = UIColor.lightGray.cgColor
        txtViewAnotacoes.layer.borderWidth = 0.25
        txtViewAnotacoes.layer.cornerRadius = 10
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pronto", style: .plain, target: self, action: #selector(cadNewClass))

        
    }
    
    @objc func cadNewClass() {
        
        let id = idSubject!
        
        guard let txtAnt = txtViewAnotacoes.text else { return }
        let newTxtAnt = txtAnt.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let txt = txtNameTheme.text else { return }
        let newTxt = txt.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if newTxt != "" && selectedButton != "" {
            Classes().createClass(id: id, name: newTxt, rate: selectedButton, obs: newTxtAnt)
            update?()
            navigationController?.popViewController(animated: true)
        } else {
            // Criando o alert
            let alert = UIAlertController(title: "Erro", message: "Os dados estão incompletos, preencha-os corretamente.", preferredStyle:  UIAlertController.Style.alert)
            
            // Adicionar a função de cancelar com "Ok" no alert
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            // Mostrando o alert na tela
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    

}
//////////Codigo com funções para utilizar constraints programaticamente
///
///
//
//extension UIView {
//
//    func anchorSize(to width: UIView, to height: UIView) {
//        var constraints = [NSLayoutConstraint]()
//
//        constraints.append(widthAnchor.constraint(equalTo: width.widthAnchor))
//        constraints.append(heightAnchor.constraint(equalTo: height.heightAnchor))
//
//        NSLayoutConstraint.activate(constraints)
//
//    }
//
//    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
//
//        var constraints = [NSLayoutConstraint]()
//
//        if let top = top {
//            constraints.append(topAnchor.constraint(equalTo: top, constant: padding.top))
//        }
//
//        if let leading = leading {
//            constraints.append(leadingAnchor.constraint(equalTo: leading, constant: padding.left))
//        }
//
//        if let bottom = bottom {
//            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
//        }
//
//        if let trailing = trailing {
//            constraints.append(trailingAnchor.constraint(equalTo: trailing, constant: -padding.right))
//        }
//
//        if size.width != 0 {
//            constraints.append(widthAnchor.constraint(equalToConstant: size.width))
//        }
//
//        if size.height != 0 {
//            constraints.append(heightAnchor.constraint(equalToConstant: size.height))
//        }
//
//        NSLayoutConstraint.activate(constraints)
//    }
//}
//
