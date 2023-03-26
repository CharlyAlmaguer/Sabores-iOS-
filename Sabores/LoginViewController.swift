//
//  LoginViewController.swift
//  Sabores
//
//  Created by Carlos Israel Almaguer Rioja on 24/03/23.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnOmitir: UIButton!
    
    var googleButton = GIDSignInButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.style = GIDSignInButtonStyle.wide
        googleButton.frame = CGRect(x: 100, y: 500, width: view.frame.width - 200, height: 40)
        self.view.addSubview(googleButton)
        googleButton.addTarget(self, action: #selector(loginWithGoogle), for: .touchUpInside)
        // Do any additional setup after loading the view.

        
    }
    
    @objc func loginWithGoogle(){
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self){
            user, error in
            if error != nil{
                print("algo salio mal con la autenticacion \(String(describing: error))")
            }else{
                guard let profile = user?.user else {return}
                var info = "nombre: " + (profile.profile?.givenName ?? "")
                info += "apellido: " + (profile.profile?.familyName ?? "")
                info += "email: " + (profile.profile?.email ?? "")
                self.performSegue(withIdentifier: "CatSegue", sender: nil)
            }
            
        }
    }
    
    @IBAction func PushbtnOmitir(_ sender: Any) {
        
        performSegue(withIdentifier: "CatSegue", sender: self)
    }
    
    

}
