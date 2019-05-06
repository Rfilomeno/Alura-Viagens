//
//  PacoteViagem.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 06/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    let nomeDoHotel:String
    let descricao:String
    let dataViagem:String
    let viagem:Viagem
    
    init(nomeDoHotel:String, descricao:String, dataViagem:String, viagem:Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
}
