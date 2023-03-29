//
//  Producto+CoreDataProperties.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 27/03/23.
//

import Foundation
import CoreData

extension Producto{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Producto> {
        return NSFetchRequest<Producto>(entityName: "Producto")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var precio: String?
    @NSManaged public var img: String?
    @NSManaged public var cantidad: String?
    @NSManaged public var costo: String?

}

extension Producto : Identifiable {

}
