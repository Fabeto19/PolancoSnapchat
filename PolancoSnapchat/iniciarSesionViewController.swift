//
//  ViewController.swift
//  PolancoSnapchat
//
//  Created by Fabricio on 7/06/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
 
class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password:
                            passwordTextField.text!){(user, error) in
        print("Intentando iniciar Sesion")
        if error != nil{
            print("Se presento el siguiente error: \(String(describing: error))")
        }else{
            print("Inicio de sesion exitoso")
        }
    }
    
}

}
