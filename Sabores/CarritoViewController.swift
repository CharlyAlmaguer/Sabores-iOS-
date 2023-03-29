//
//  CarritoViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 25/03/23.
//

import UIKit
import CoreData

class CarritoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var dataManager = ProductoDataManager?.none

    @IBOutlet weak var labelTotal: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var total : Double = 0.0
    var i : Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dataManager = ProductoDataManager(context: context)
        dataManager?.fetch()
        
        if (dataManager?.countItems())!<0 {
            
        }else{
            //Lenamos nuestro arreglo a mostrar
            while i < ((dataManager?.countItems())!){
                total += Double(dataManager?.getItem(at: i).costo ?? "") ?? 0.0
                i += 1
            }
            i = 0
            
            labelTotal.text = "Total: $" + String(total)
            
        }
        
        //Registramos la celda personalizada
        tableView.register(UINib(nibName: "CarritoTableViewCell", bundle: nil), forCellReuseIdentifier: "CarritoCell")
        tableView.rowHeight = 70
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.countItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarritoCell", for: indexPath) as! CarritoTableViewCell
        
        cell.ivCarrito.image = UIImage(named: dataManager?.getItem(at: indexPath.row).img ?? "")
        cell.labelTituloCarrito.text = dataManager?.getItem(at: indexPath.row).nombre
        cell.labelPrecioCarrito.text = dataManager?.getItem(at: indexPath.row).precio
        
        return cell
        
    }
    
    //Funcion para eliminar elementos del carrito
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accionEliminar = UIContextualAction(style: .normal, title: "Eliminar" ){_,_,_ in
            
            self.total -= Double(self.dataManager?.getItem(at: indexPath.row).costo ?? "") ?? 0.0
            
            self.context.delete((self.dataManager?.getItem(at: indexPath.row))!)
            self.dataManager?.remove(at: indexPath.row)
            
            do{
                try self.context.save()
            }
            catch{
                print("Error al guardar")
            }
            self.tableView.reloadData()
            
            self.labelTotal.text = "Total: $" + String(self.total)
            
            }
        
        accionEliminar.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [accionEliminar])
    }
    
    
}
