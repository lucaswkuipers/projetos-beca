//
//  Filtro.swift
//  Agenda
//
//  Created by Lucas Werner Kuipers on 22/03/2021.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {
    
    func filtraAlunos(listaDeAlunos:[Aluno], texto:String) -> [Aluno] {
        let alunosEncontrados = listaDeAlunos.filter { (aluno) -> Bool in
            if let nome = aluno.nome {
                return nome.contains(texto)
            }
            return false
        }
        return alunosEncontrados
    }
    
}
