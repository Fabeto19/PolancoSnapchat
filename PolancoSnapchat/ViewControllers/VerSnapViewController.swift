//
//  VerSnapViewController.swift
//  PolancoSnapchat
//
//  Created by Fabricio on 14/06/23.
//

import UIKit
import SDWebImage
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import AVFAudio

class VerSnapViewController: UIViewController {
    var reproducirAudio:AVAudioPlayer?

    @IBOutlet weak var lblMensaje: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var snap = Snap()
    
    @IBAction func reproducir(_ sender: Any) {
        
        let urlstring = snap.audioURL
            let url = NSURL(string: urlstring)
            print("Reproduciendo")
            
        play(url: url!)

                
        
        /*do{
            
            let urlstring = NSURL(string: snap.audioURL)
            reproducirAudio = try AVAudioPlayer(contentsOf: urlstring as! URL)
            reproducirAudio!.play()
            print("reproduciendo audio")
            
        }catch let error as NSError {
            print(error.localizedDescription)
        }*/
    }
    
    func play(url:NSURL) {
        print("playing \(url)")
        
        do {
            let player = try AVAudioPlayer(contentsOf: url as URL)
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
        }
        
    }
    
  
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMensaje.text = "Mensaje: "+snap.descrip
        imageView.sd_setImage(with:URL(string: snap.imagenURL),completed: nil)
        print(snap.imagenURL)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").child(snap.id).removeValue()
        
        Storage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete
        {(error) in
            print("se elimino la imagen correctamente")
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
