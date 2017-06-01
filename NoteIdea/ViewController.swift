//
//  ViewController.swift
//  NoteIdea
//
//  Created by Thalles Henrique on 10/04/17.
//  Copyright © 2017 Thalles Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate , UITextViewDelegate {
    
    @IBOutlet weak var tfTitulo: UITextField!
    
    @IBOutlet weak var tvConteudo: UITextView!
    
    @IBOutlet weak var btSalvar: UIBarButtonItem!
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        let isAdicionando = presentingViewController is UINavigationController
        
        if(isAdicionando){
            dismissViewControllerAnimated (true, completion: nil)
            //sair sem alterar nada
        }else if let onwing = navigationController{
            onwing.popViewControllerAnimated(true)
        }else{
            fatalError("A ViewController não está dentro de um NavigationController")
        }

    }
    
    
    
    var nota = Nota?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTitulo.delegate = self
        tvConteudo.delegate = self
        
        if let nota = nota{
            tfTitulo.text = nota.titulo
            tvConteudo.text = nota.conteudo
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        super.prepareForSegue(segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem where button === btSalvar else{
            return
        }
        
        let titulo = tfTitulo.text ?? ""
        let conteudo = tvConteudo.text ?? ""
        
        nota = Nota.init(titulo: titulo, conteudo: conteudo)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //ocultar o teclado
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        tfTitulo.text = textField.text
    }

    func textViewDidEndEditing(textView: UITextView) {
        tvConteudo.text = textView.text
    }
    
    
}

