//
//  ProfileViewController.swift
//  Project052024
//
//  Created by Ахмад Амирович on 08.10.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(GradientView(frame: view.bounds))
        setupUI()
        constraints()
    }
    
    //MARK: setupUI
    private func setupUI() {
        
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        
        setupTextField(fullNameTextField, placeholder: "Full Name")
        setupTextField(nickNameTextField, placeholder: "Nickname")
        setupTextField(emailTextField, placeholder: "Email Address")
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.cornerRadius = 15
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        saveButton.backgroundColor = UIColor(red: 191.0/255.0,
                                             green: 183.0/255.0,
                                             blue: 253.0/255.0,
                                             alpha: 0.5)
        
        saveButton.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        view.addSubview(saveButton)
        
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 15
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        let borderLabel = UILabel()
        borderLabel.frame = CGRect(x: textField.frame.origin.x, y: textField.frame.origin.y, width:
                                        textField.frame.size.width, height: textField.frame.size.height)
        borderLabel.layer.borderColor = UIColor.white.cgColor
        borderLabel.layer.borderWidth = 1.0
        borderLabel.layer.cornerRadius = 5.0
        borderLabel.backgroundColor = .blue
        //borderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(borderLabel)
        
        NSLayoutConstraint.activate([
            borderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            borderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
        ])
        
    }
    
    //MARK: constraints
    private func constraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 105),
            imageView.heightAnchor.constraint(equalToConstant: 105),
            
            fullNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullNameTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            fullNameTextField.widthAnchor.constraint(equalToConstant: 300),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),

            nickNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nickNameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 30),
            nickNameTextField.widthAnchor.constraint(equalToConstant: 300),
            nickNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 300),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func saveProfile() {
            // Логика сохранения профиля
    }

}
