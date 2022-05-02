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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtViewAnotacoes.layer.borderColor = UIColor.black.cgColor
        txtViewAnotacoes.layer.borderWidth = 10

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    

}
//////////Codigo com funções para
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
