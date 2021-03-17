//
//  Refeicao.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var  itens: Array<Item> = []
    
    // MARK: - Construtor
    
    init(nome: String = "Sushi", felicidade: Int = 10, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - NSCoding
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")

    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade") 
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
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
