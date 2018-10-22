//
//  LoginController+handle.swift
//  gameofchat
//
//  Created by JaesungMoon on 2017/07/30.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func handleSelectProfileImageView() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    func handleRegister() {
        
        guard let email = emailTextfield.text, let password = passwordTextfield.text, let name = nameTextfield.text else{
            print("form is not vaild")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil{
                print(error as Any)
                return
            }
            
            guard let uid = user?.uid else{
                return
            }
            
            //successfully authenthcated user
            
            
            
            
            
            
            
            let ref = Database.database().reference(fromURL: "https://gameofchat-995de.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil{
                    print(error as Any)
                    return
                }
                print("saved user successfully into Firebase db")
                self.dismiss(animated: true, completion: nil)
            })
            
        }
    }

}

