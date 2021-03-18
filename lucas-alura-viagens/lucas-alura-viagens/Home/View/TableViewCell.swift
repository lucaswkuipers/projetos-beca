//
//  TableViewCell.swift
//  lucas-alura-viagens
//
//  Created by Lucas Werner Kuipers on 17/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configuraCelula(viagem: Viagem) {
        
        labelTitulo.text  = viagem.titulo
        labelQuantidadeDias.text = "\(viagem.quantidadeDeDias) dia" + (viagem.quantidadeDeDias > 1 ? "s" : "")
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true
    }
}
