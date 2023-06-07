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
        Auth.auth().signIn(withEmail: emailTextField.text!, password:
                            passwordTextField.text!){(user, error) in
        print("Intentando iniciar Sesion")
        if error != nil{
            print("Se presento el siguiente error: \(error)")
            Auth.auth().createUser(withEmail: self.emailTextField.text!, password:
                                    self.passwordTextField.text!, completion: {(user, error) in
                print("Intentando Crear un  Usuario")
                if error != nil{
                    print("Se presento el siguiente error al crear usuario: \(error)")
                }else{
                    print("El usuario fue creado exitosamente")
                    
                    Database.database().reference().child("usuarios")
                        .child(user!.user.uid).child("email").setValue(user!.user.email)
                    
                    let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario: \(self.emailTextField.text!) Se creo correctamente", preferredStyle: .alert)
                    let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler:
                                                {(UIAlertAction) in
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    })
                    alerta.addAction(btnOK)
                    self.present(alerta, animated:true, completion: nil )
                }
                                              
            })
        }else{
            print("Inicio de sesion exitoso")
            self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
        }
        }
    }
}
   
