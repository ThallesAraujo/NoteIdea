//
//  Nota.swift
//  NoteIdea
//
//  Created by Thalles Henrique on 10/04/17.
//  Copyright © 2017 Thalles Henrique. All rights reserved.
//

import UIKit

class Nota{
    
    var titulo: String
    var conteudo: String
    
    init?(titulo:String, conteudo:String){
        
        self.titulo = titulo
        self.conteudo = conteudo
        
        if(titulo.isEmpty || !conteudo.isEmpty){
            self.titulo = conteudo
        }
        
        if(titulo.isEmpty && conteudo.isEmpty){
            return nil
        }
        
    }
    
}
