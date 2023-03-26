//
//  PortadaViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 23/03/23.
//

import UIKit
import Network

class PortadaViewController: UIViewController {
    
    
    @IBOutlet weak var btnComenzar: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monitor = NWPathMonitor()
         
         monitor.start(queue: DispatchQueue.global())
         monitor.pathUpdateHandler = { path in
             var mensaje = ""
             if path.status == .satisfied {
                 
                 if path.usesInterfaceType(.wifi){
                     mensaje = "La conexion a internet es WiFi"
                 }else{
                     mensaje = "La conexion a internet no es WiFi. Se consumira su paquete de datos"
                 }
                
             }else{
                 mensaje = "No hay conexion a internet"
                
                let ac = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default){
                    alertaction in
                    exit(0)
                }
                ac.addAction(action)
                DispatchQueue.main.async {
                    self.present(ac, animated: true)
                }
                
             }
             
             let ac = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
             
             let action = UIAlertAction(title: "Ok", style: .default){
                 alertaction in
                 
             }
             ac.addAction(action)
             DispatchQueue.main.async {
                 self.present(ac, animated: true)
             }
       
          }
    }
    
    @IBAction func PushbtnComenzar(_ sender: Any) {
        
        performSegue(withIdentifier: "LoginSegue", sender: self)
    }
    
    
}
