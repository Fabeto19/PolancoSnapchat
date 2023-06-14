//
//  VerSnapViewController.swift
//  PolancoSnapchat
//
//  Created by Fabricio on 14/06/23.
//

import UIKit
import SDWebImage
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class VerSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblMensaje: UILabel!
    
    var snap  = Snap ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMensaje.text = "Mensaje:" + snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imagenURL), completed: nil )

    }
    override func viewWillDisappear(_ animated: Bool) {
       
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").child(snap.id).removeValue()

    }

}
