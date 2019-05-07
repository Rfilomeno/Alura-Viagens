//
//  PcoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 02/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacote:PacoteViagem){
        
        labelTitulo.text = pacote.viagem.titulo
        labelQuantidadeDeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}
