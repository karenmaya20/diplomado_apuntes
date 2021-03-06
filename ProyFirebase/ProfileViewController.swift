//
//  ProfileViewController.swift
//  ProyFirebase
//
//  Created by Germán Santos Jaimes on 13/03/20.
//  Copyright © 2020 iosLab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage
import MobileCoreServices
import FirebaseUI

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userID:String!
    var getRef: Firestore!
    
    var optimizedImage: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRef = Firestore.firestore()
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("Usuario no loggeado")
            } else {
                self.userID = user?.uid
                self.emailLabel.text = user?.email
                self.getName()
                self.getPhoto()
            }
        }
        
        
    }
    
    func getPhoto(){
        let storageReference = Storage.storage().reference()
        let placeHolder = UIImage(named: "anon")
        
        let userImageRef = storageReference.child("/photos").child(self.userID)
        
        
        userImageRef.downloadURL { (url, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Imagen descargada")
            }
        }
        
        profileImage.sd_setImage(with: userImageRef, placeholderImage: placeHolder)
    }
    
    
    
    func getName(){
        let result = getRef.collection("users").document(userID)
        result.getDocument { (snapshot, error) in
            let lastname = snapshot?.get("lastname") as? String ?? "sin valor"
            let name = snapshot?.get("name") as? String ?? "sin valor"
            
            self.nameLabel.text = "\(name) \(lastname)"
        }
        
    }
    
    
    @IBAction func uploadPhoto(_ sender: UIButton) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self
        
        present(photoImage, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
            profileImage.image = imageSelected
            self.saveImage(optimizedImageData)
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    func saveImage(_ imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        activityIndicator.color = .red
        activityIndicator.center = profileImage.center
        
        activityIndicator.startAnimating()
        profileImage.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/photos").child(userID)
        let uploadMetadata = StorageMetadata()
        
        uploadMetadata.contentType = "image/jpeg"
        
        userImageRef.putData(imageData, metadata: uploadMetadata) { (storageMetadata, error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            
            if let error = error{
                print("error: ", error.localizedDescription)
            }else{
                print(storageMetadata?.path!)
            }
        }
    }

}
