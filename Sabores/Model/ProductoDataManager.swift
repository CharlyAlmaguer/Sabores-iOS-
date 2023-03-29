//
//  ProductoDataManager.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 27/03/23.
//

import Foundation
import CoreData

class ProductoDataManager {
    
    private var items : [Producto] = []
    private var context : NSManagedObjectContext

    //inicializamos nuestro contexto
    init(context : NSManagedObjectContext){
        self.context = context
    }
    //carga todo el arreglo
    func fetch(){
        do {
            self.items = try self.context.fetch(Producto.fetchRequest())
        }
        catch{
            print("Error :", error)
        }

    }
    
    //obtiene un elemnto del arreglo
    func getItem(at index: Int) -> Producto{
        return items[index]
    }
    
    //cuenta el numero de elementos que hay en el arreglo
    func countItems() -> Int {
        return items.count
    }
    
    //elimina un elemento de nuestro arreglo de tareas
    func remove(at index: Int){
        items.remove(at: index)
    }
    
}
