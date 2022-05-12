//
//  ClassesTableViewCell.swift
//  NanoChallenge#3
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 26/04/22.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    //ligando a label da célula para usar de estrutura para inserir os dados na função cellForRowAt da classe ClassesViewController
    @IBOutlet weak var lblClasses: UILabel!
    
    @IBOutlet weak var vwColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
