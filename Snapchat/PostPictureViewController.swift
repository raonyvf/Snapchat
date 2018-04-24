//
//  PostPictureViewController.swift
//  Snapchat
//
//  Created by Raony Ferreira on 24/04/18.
//  Copyright © 2018 RaonyVieira. All rights reserved.
//

import UIKit
import Firebase

class PostPictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        let imagesFolder = Storage.storage().reference().child("images")
        
        
        //NSUUID().uuidString = Gera um id automaticamente para a imagem que está fazendo o upload.
        imagesFolder.child("\(NSUUID().uuidString).jpeg").putData(imageData, metadata: nil) { (metadata, error) in
            
            print("Estamos enviando a imagem")
            
            if error != nil {
                print("Ocorreu um erro ao enviar a imagem: \(error!)")
            } else {
                print("Imagem enviada com sucesso")
                print(metadata?.downloadURL()!)
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
