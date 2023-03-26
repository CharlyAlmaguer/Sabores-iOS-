//
//  CategoriasViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 25/03/23.
//

import UIKit

class CategoriasViewController: UIViewController {
    
    @IBOutlet weak var btnChocolates: UIButton!
    
    @IBOutlet weak var btnPalomitas: UIButton!
    
    @IBOutlet weak var btnManzanas: UIButton!
    
    @IBOutlet weak var btnPastelillos: UIButton!
    
    @IBOutlet weak var btnOtros: UIButton!
    
    @IBOutlet weak var btnCarrito: UIButton!
    
    var categoria: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PushbtnCho(_ sender: Any) {
        categoria = "chocolates"
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    @IBAction func PushbtnPal(_ sender: Any) {
        categoria = "palomitas"
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    @IBAction func PushbtnMan(_ sender: Any) {
        categoria = "manzanas"
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    @IBAction func PushbtnPas(_ sender: Any) {
        categoria = "pastelillos"
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    @IBAction func PushbtnOtr(_ sender: Any) {
        categoria = "otros"
        performSegue(withIdentifier: "tableSegue", sender: self)
    }
    
    @IBAction func PushbtnCarrito(_ sender: Any) {
        
        performSegue(withIdentifier: "CarritoSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableSegue" {
          let destination = segue.destination as! ListTableViewController
            destination.categoria = categoria
            
        }
    }
    
    

}
