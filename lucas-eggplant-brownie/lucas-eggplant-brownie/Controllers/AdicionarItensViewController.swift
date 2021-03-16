//
//  AdicionarItensViewController.swift
//  lucas-eggplant-brownie
//
//  Created by Lucas Werner Kuipers on 16/03/2021.
//  Copyright © 2021 everis. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
    
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?

    init(delegate: AdicionaItensDelegate) {
            super.init(nibName: "AdicionarItensViewController", bundle: nil)
            self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        guard let numeroDeCalorias = Double(calorias) else { return }
        let item = Item(nome: nome, calorias: numeroDeCalorias)
        
        // 1:
//        if delegate == nil {
//            return
//        }
//        delegate!.add(item)
        
        // 2:
//        if delegate != nil {
//            delegate!.add(item)
//        }
        
        // 3:
//        if let delegate = delegate {
//            delegate.add(item)
//        }
//
        // 4:
//        guard let delegate = delegate else { return }
//        delegate.add(item)
        
        // 5:
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
        }
    }
