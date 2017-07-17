//
//  LoginController.swift
//  gameofchat
//
//  Created by 文 載盛(B04680) on 2017/07/03.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController {

    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        
        return button
    }()
    
    func handleLoginRegister() {
        if loginRegistersegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        guard let emali = emailTextfield.text, let password = passwordTextfield.text else{
            print("form is not vaild");
            return
        }
        Auth.auth().signIn(withEmail: emali, password: password, completion: {
            (user, error) in
            if error != nil {
                print(error)
                return
            }
            // successfully logged in our user
            self.dismiss(animated: true, completion: nil)
        })
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
//                print("saved user successfully into Firebase db")
                self.dismiss(animated: true, completion: nil)
            })
            
        }
    }
    let nameTextfield: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparetorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparetorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo_splash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var loginRegistersegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .white
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleLoginRigisterChange), for: .valueChanged)
        return sc
    }()
    func handleLoginRigisterChange() {
        let title = loginRegistersegmentedControl.titleForSegment(at: loginRegistersegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        // change height of inputcontainerView, but how??
        let isLeft = loginRegistersegmentedControl.selectedSegmentIndex == 0
        inputContainerViewHeightAnchor?.isActive = false
        inputContainerViewHeightAnchor?.constant = isLeft ? 100 : 150
        inputContainerViewHeightAnchor?.isActive = true
        
        nameTextFieldViewHeightAnchor?.isActive = false
        nameTextFieldViewHeightAnchor = nameTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: isLeft ? 0 : 1/3)
        nameTextFieldViewHeightAnchor?.isActive = true
        nameTextfield.isHidden = isLeft

        // change height of nameTextField
        emailTextFieldViewHeightAnchor?.isActive = false
        emailTextFieldViewHeightAnchor = emailTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: isLeft ? 1/2 : 1/3)
        emailTextFieldViewHeightAnchor?.isActive = true

        passwordTextFieldViewHeightAnchor?.isActive = false
        passwordTextFieldViewHeightAnchor = passwordTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: isLeft ? 1/2 : 1/3)
        passwordTextFieldViewHeightAnchor?.isActive = true
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        
        view.addSubview(inputContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegistersegmentedControl)
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        setupLoginRegisterSegmentedControl()
        
    }
    
    func setupLoginRegisterSegmentedControl(){
        //need x, y, width, height constaints
        loginRegistersegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegistersegmentedControl.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -12).isActive = true
        loginRegistersegmentedControl.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, multiplier: 1).isActive = true
        loginRegistersegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupProfileImageView(){
        //need x, y, width, height constaints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegistersegmentedControl.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func setupLoginRegisterButton(){
        //need x, y, width, height constaints
        loginRegisterButton.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    var inputContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldViewHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldViewHeightAnchor: NSLayoutConstraint?
    
    func setupInputsContainerView(){
        //need x, y, width, height constaints
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerViewHeightAnchor = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
            
        inputContainerViewHeightAnchor?.isActive = true
        
        inputContainerView.addSubview(nameTextfield)
        inputContainerView.addSubview(nameSeparetorView)
        inputContainerView.addSubview(emailTextfield)
        inputContainerView.addSubview(emailSeparetorView)
        inputContainerView.addSubview(passwordTextfield)
        
        
        //need x, y, width, height constaints
        nameTextfield.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextfield.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true

        nameTextfield.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        nameTextFieldViewHeightAnchor = nameTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldViewHeightAnchor?.isActive = true
        
        
        nameSeparetorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeparetorView.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor).isActive = true
        nameSeparetorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeparetorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //need x, y, width, height constaints
        emailTextfield.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: nameSeparetorView.bottomAnchor).isActive = true
        emailTextfield.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        emailTextFieldViewHeightAnchor = emailTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldViewHeightAnchor?.isActive = true
        
        emailSeparetorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSeparetorView.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        emailSeparetorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSeparetorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constaints
        passwordTextfield.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        passwordTextfield.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        passwordTextFieldViewHeightAnchor = passwordTextfield.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldViewHeightAnchor?.isActive = true;
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha:1)
    }
}

