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
    
    //Criando função que ira fazer a logica de cliques nos botões
    
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
        
        //deixando a opacidade de todos botões na metade no inicio do programa
        btnMuitoBom.layer.opacity = 1
        btnBom.layer.opacity = 1
        btnRazoavel.layer.opacity = 1
        btnPouco.layer.opacity = 1
        btnMuitoPouco.layer.opacity = 1
        
        //Estilizando textView programaticamente
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
