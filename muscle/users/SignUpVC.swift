//
//  SignUpVC.swift
//  muscle
//
//  Created by 笹倉 一也 on 2017/12/16.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var iconImage: UIImageView!
    
    let picker = UIImagePickerController()
    var userStorge: StorageReference!
    var ref: DatabaseReference!
    
    // インスタンス変数
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        let storage = Storage.storage().reference(forURL: "gs://muscle-c56b2.appspot.com/")
        ref = Database.database().reference()
        userStorge = storage.child("users")
        
        
    }
    
    
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        //インスタンスを作成
        DBRef = Database.database().reference()
        
        guard let username = usernameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            
            else {
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            if let user = user {
                
                let changeRequest = Auth.auth().currentUser!.createProfileChangeRequest()
                changeRequest.displayName = self.usernameTF.text!
                changeRequest.commitChanges(completion: nil)
                
                
                let imageRef = self.userStorge.child("\(user.uid).jpg")
                
                let data = UIImageJPEGRepresentation(self.iconImage.image!, 0.5 )
                
                let uploadTask = imageRef.putData(data!, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                    imageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                        }
                        
                        if let url = url {
                            let userInfo: [String : Any] = ["uid" : user.uid,
                                                            "name" : self.usernameTF.text,
                                                            "urlToImage" : url.absoluteString]
                            self.ref.child("users").child(user.uid).setValue(userInfo)
                            
                            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")
                            
                            self.present(vc, animated: true, completion: nil)
                        }
                    })
                })
                
                uploadTask.resume()
            }
            
            
            
            
            guard let user = user else {
                return
            }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                
            })
        }
    }
    
    
    @IBAction func fileImageTapped(_ sender: UIButton) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.iconImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
}
