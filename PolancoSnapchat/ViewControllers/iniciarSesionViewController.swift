//
//  ViewController.swift
//  PolancoSnapchat
//
//  Created by Fabricio on 7/06/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user , error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
                let alerta = UIAlertController(title: "creacion de usuario nuevo: ", message: "usuario \(self.emailTextField.text!) se creo correctamente", preferredStyle: .alert)
                let btnOK =  UIAlertAction(title: "crear", style: .default, handler:
                    { (UIAlertAction) in
                    self.performSegue(withIdentifier: "crearSegue", sender: nil)
                })
                let btnCANCELAR =  UIAlertAction(title: "cancelar", style: .default, handler:nil
                )
                alerta.addAction(btnOK)
                alerta.addAction(btnCANCELAR)
                self.present(alerta, animated: true,completion: nil)
            }else {
                print("Inicio de Sesion exitosa")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
            
        }
    }
    
    
    
}

