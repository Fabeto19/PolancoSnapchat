//
//  crearUsuarioController.swift
//  PolancoSnapchat
//
//  Created by Fabricio on 14/06/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class crearUsuarioController: UIViewController {

    
    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtContraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func crear(_ sender: Any) {
    
    Auth.auth().createUser(withEmail: self.txtUsuario.text!, password: self.txtContraseña.text!,completion: {(user ,error) in
                   print("Intentando crear un usuario")
                       if error != nil{
                   print("Se presento el siguiente error al crear el usuario: \(error)")
                  }else {
                     print("El usuario fue creado exitosamente")
                
                     Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                
                     let alerta = UIAlertController(title: "creacion de usuario: ", message: "usuario \(self.txtUsuario.text!) se creo correctamente", preferredStyle: .alert)
                     let btnOK =  UIAlertAction(title: "aceptar", style: .default, handler:
                      { (UIAlertAction) in
                        self.performSegue(withIdentifier: "iniciarCrear", sender: nil)
                     })
                      alerta.addAction(btnOK)
                       self.present(alerta, animated: true,completion: nil)
                
            }
        })
      }
    
    
    

        }
