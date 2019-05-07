//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 07/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    var pacoteComprado: PacoteViagem? = nil

    @IBOutlet weak var botaoHome: UIButton!
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteComprado{
            imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            labelHotelPacoteViagem.text = pacote.nomeDoHotel
            labelDataPacoteViagem.text = pacote.dataViagem
            labelDescricaoPacoteViagem.text = pacote.descricao
        }
        imagemPacoteViagem.layer.cornerRadius = 10
        imagemPacoteViagem.layer.masksToBounds = true
        botaoHome.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    

    @IBAction func botaoVoltarHome(_ sender: UIButton)
    {
        if let navigation = self.navigationController{
            navigation.popToRootViewController(animated: true)
        }
    }
    
}
