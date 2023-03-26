//
//  ListTableViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 25/03/23.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var categoria: String?
    var productos = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if categoria=="chocolates" {
            productos = getChocolates()
        }else if categoria=="palomitas"{
            productos = getPalomitas()
        }else if categoria=="manzanas"{
            productos = getManzanas()
        }else if categoria=="pastelillos"{
            productos=getPastelillos()
        }else if categoria=="otros"{
            productos=getOtros()
        }
    
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        cell.labelTitulo.text = productos[indexPath.row].nombre
        
        return cell
    }

    func getChocolates() -> Array<List> {
        var data = [List]()
        data.append(List(id:100, nombre: "Mini Magnum", descripcion: "Paletas en forma de mini Magnum rellenas de pastel cubiertas de chocolate.", precio: "$15.00 c/u", img: "", costo: 15.00))
        data.append(List(id:101, nombre: "Trufas de Chocolate", descripcion: "Trufas de chocolate cubiertas de granillo de chocolate amargo/con leche/blanco.", precio: "$12.00 paquete con 4 pz.", img: "", costo: 12.00))
        data.append(List(id:102, nombre: "Bombon de Cafe", descripcion: "Bombon sabor cafe cubierto de chocolate semi amargo.", precio: "$15.00 paquete con 3 pz.", img: "", costo: 15.00))
        data.append(List(id:103, nombre: "Bombones de Amaranto", descripcion: "Bombones cubierto de chocolate con leche espolvoreados de amaranto.", precio: "$15.00 paquete con 3 pz.", img: "", costo: 15.00))
        
        return data
    }
    
    func getPalomitas() -> Array<List> {
        var data = [List]()
        data.append(List(id:200, nombre: "Palomitas Oreo", descripcion: "Palomitas sabor galleta oreo bañadas en chocolate blanco.", precio: "$15.00 bolsa con 30 gr.", img: "", costo: 15.00))
        data.append(List(id:201, nombre: "Palomitas Moka", descripcion: "Palomitas de café, con malvaviscos, salpicado con chocolate y trozos de nuez.", precio: "$15.00 bolsa con 30 gr.", img: "", costo: 15.00))
        
        return data
    }
    
    func getManzanas() -> Array<List> {
        var data = [List]()
        data.append(List(id:300, nombre: "Manzanas de Caramelo", descripcion:"Deliciosas manzanas cubiertas de nuestra receta de caramelo clasico.", precio: "$15.00 c/u", img: "", costo: 15.00))
        
        return data
    }
    
    func getPastelillos() -> Array<List> {
        var data = [List]()
        data.append(List(id:400, nombre: "Brownies", descripcion: "Nuestros deliciosos brownies de la casa con el mejor sabor a chocolate que te encantaran.", precio: "$12.50 c/u", img: "", costo: 12.50))
        data.append(List(id:401, nombre: "Cup Cake Limon", descripcion: "Panesillos sabor vainilla con nuestro delicioso chantilli de limon.", precio: "$18.00 c/u", img: "", costo: 18.00))
        data.append(List(id:402, nombre: "Tarta de Frutas", descripcion: "Tarta de queso con relleno de crema pastelera decorada con fruta fresca.", precio: "$25.00 c/u", img: "", costo: 25.00))
        
        return data
    }
    
    func getOtros() -> Array<List> {
        var data = [List]()
        data.append(List(id:500, nombre: "Paletas Corazon", descripcion: "Paletas de corazón geométrico rellenas de chocoamaranto y cubiertas de chocolate.", precio: "$17.00 c/u", img: "", costo: 17.00))
        data.append(List(id:501, nombre: "Galletas Decoradas", descripcion: "Galletas de mantequilla decoradas con chocolate y confeti comestible.", precio: "$17.00 c/u", img: "", costo: 17.00))
        data.append(List(id:502, nombre: "Cake Pop", descripcion: "Paletas de pastel sabor chocolate/mantequilla/vainilla cubiertas de chocolate.", precio: "$17.00 c/u", img: "", costo: 17.00))
       
        return data
    }
}
