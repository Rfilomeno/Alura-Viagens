//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 06/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var botaoFinalizarCompra: UIButton!
    
    var pacoteSelecionado:PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        botaoFinalizarCompra.layer.cornerRadius = 8
        
        if let pacote = pacoteSelecionado{
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
        
    }
    
    @objc func aumentarScroll(notification:Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        self.scrollPrincipal.contentOffset.y = 300
        
    }
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let navigation = self.navigationController{
            navigation.popViewController(animated: true)
        }
        
        
    }
    @objc func exibeDataTextField(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    @IBAction func textFieldEntrouEmFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
        sender.inputView = datePickerView
    }
    
    
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
