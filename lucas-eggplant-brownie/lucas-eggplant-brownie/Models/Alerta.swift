//
//  Alerta.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Desculpe", mensagem: String = "Houve um erro :(") {
        let alerta = UIAlertController(title: titulo , message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
