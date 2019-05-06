//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 02/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    @objc let titulo : String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
   

    init(titulo:String,quantidadeDeDias:Int,preco:String,caminhoDaImagem: String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
    
}
