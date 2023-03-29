//
//  DetailViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 28/03/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var ivDetail: UIImageView!
    
    @IBOutlet weak var labelTituloDetail: UILabel!
    
    @IBOutlet weak var labelDescDetail: UILabel!
    
    @IBOutlet weak var labelPrecioDetail: UILabel!
    
    var imagen: String?
    var titulo: String?
    var descripcion: String?
    var precio: String?
    var costo: Double?
    
    var addItem: Producto?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivDetail.image = UIImage(named: imagen!)
        labelTituloDetail.text = titulo
        labelDescDetail.text = descripcion
        labelPrecioDetail.text = precio
        
        addItem = Producto(context: context)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ListTableViewController
        
        addItem?.nombre = titulo
        addItem?.precio = precio
        addItem?.cantidad = "1"
        addItem?.costo = String(costo!)
        addItem?.img = imagen
        
        destination.currentItem = addItem
    }
    

}
