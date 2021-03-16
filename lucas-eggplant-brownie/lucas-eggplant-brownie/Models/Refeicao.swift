//
//  Refeicao.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var  itens: Array<Item> = []
    
    // MARK: - Construtorr
    
    
    init(nome: String = "Sushi", felicidade: Int = 10, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - Métodos
    
    func totalDeCalorias() -> Double {
        var total: Double = 0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)\n"
        
        for item in itens {
            mensagem += "\(item.nome) - Calorias: \(item.calorias)\n"
        }
        
        return mensagem
    }
}
