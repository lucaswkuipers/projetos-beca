//
//  Item.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class Item: NSObject {

    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Construtor
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
