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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tfTitulo.delegate = self
        tvConteudo.delegate = self
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

