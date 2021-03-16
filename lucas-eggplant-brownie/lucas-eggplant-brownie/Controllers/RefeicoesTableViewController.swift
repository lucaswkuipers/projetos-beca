//
//  RefeicoesTableViewController.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Sushi", felicidade: 100),
                     Refeicao(nome: "Feijao", felicidade: 2),
                     Refeicao(nome: "Hamburguer", felicidade: 6),
                     Refeicao(nome: "Pizza", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()

    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            func  removeRefeicao(alerta: UIAlertAction) {
                print("remover refeicao: \(refeicao.nome)")
                refeicoes.remove(at: indexPath.row)
                tableView.reloadData()
            }
            
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
            alerta.addAction(botaoCancelar)
            let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: removeRefeicao)
            alerta.addAction(botaoRemover)
            
            present(alerta, animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            } 
        }
    }
}
