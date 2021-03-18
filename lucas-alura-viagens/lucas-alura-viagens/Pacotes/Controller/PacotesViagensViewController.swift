//
//  PacotesViagensViewController.swift
//  lucas-alura-viagens
//
//  Created by Lucas Werner Kuipers on 17/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    @IBOutlet weak var labelContadorPacotes: UILabel!
    let listaComTodosPacotes: [PacoteViagem] = PacoteViagemDAO().retornaTodasAsViagens()
    var listaPacotes: [PacoteViagem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaPacotes = listaComTodosPacotes
        
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        
        self.labelContadorPacotes.text = atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaPacotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaPacotes[indexPath.item]
        
        celulaPacote.labelTitulo.text  = pacoteAtual.viagem.titulo
        celulaPacote.labelQuantidadeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 10, height: 160)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaPacotes = listaComTodosPacotes
        if searchText != "" {
            let filtroListaPacote = NSPredicate(format: "viagem.titulo contains [cd] %@", searchText)
            let listaFiltrada: Array<PacoteViagem> = (listaPacotes as NSArray).filtered(using: filtroListaPacote) as! Array
            listaPacotes = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaPacotes[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true, completion: nil)
    }
    
    func atualizaContadorLabel() -> String {
        return listaPacotes.count == 1 ? "1 pacote encontrado" : "\(listaPacotes.count) pacotes encontrados"
    }
    
}
