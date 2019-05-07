//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Rodrigo Filomeno on 02/05/2019.
//  Copyright © 2019 Filomeno. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate{
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        self.labelContadorPacotes.text = atualizaContadorLabel()
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        let pacoteAtual = listaViagens[indexPath.item]
        celulaPacote.configuraCelula(pacote: pacoteAtual)
        
        return celulaPacote
        
    }
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: (collectionView.bounds.width / 2) - 20, height: 160) : CGSize(width: (collectionView.bounds.width / 3) - 20, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let controller = storybord.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains %@", searchText)
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array<PacoteViagem>
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLabel() -> String{
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
    
    
}
