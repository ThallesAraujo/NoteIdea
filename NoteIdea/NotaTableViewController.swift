//
//  NotaTableViewController.swift
//  NoteIdea
//
//  Created by Thalles Henrique on 12/04/17.
//  Copyright © 2017 Thalles Henrique. All rights reserved.
//

import UIKit

class NotaTableViewController: UITableViewController {
    
    
    var notas = [Nota]()

    //carregamento de dados placebo para a demonstração da view
    private func getPlacebo(){
        
        //Lembrete: classes com construtores falíveis SEMPRE devem ser instanciadas desta forma
        //Ao usar os atributos, dispensa-se o ? antes do . O mesmo só é usado em construtores infalíveis (normais)
        
        guard let nota1 = Nota.init(titulo: "Compras:", conteudo: "Leite, Ovos, Manteiga, Farinha") else{
            fatalError("Nota 1 não instanciada")
        }
       guard let nota2 = Nota.init(titulo: "Contatos - Martin J. Newman", conteudo: "martin.newman@mail.com, +21333398765") else{
            fatalError("Nota 2 não instanciada")
            
        }
       guard let nota3 = Nota.init(titulo: "Lembrar de comprar o remédio", conteudo: "") else{
            fatalError("Nota 3 não instanciada")
        }
        
        notas += [nota1,nota2,nota3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlacebo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

   
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
            return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return notas.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "NotaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? NotaTableViewCell else{
            
            fatalError("Nota Invalida")
        }
        
        let nota = notas[indexPath.row]
        
        cell.lbTitulo.text = nota.titulo
        cell.lbConteudo.text = nota.conteudo

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
}
