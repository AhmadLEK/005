//
//  WelcomeViewController.swift
//  Project052024
//
//  Created by Ахмад Амирович on 05.10.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var customButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(GradientView(frame: view.bounds))
        constraints()
    }
    
    func label() {
        welcomeLabel.text = "WELCOME!"
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func settingsTextView() {
        textView.text = "To help you start trading profitably, here are some important steps you should take for successful onboarding"
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func button() {
        customButton.setTitle("Discover", for: .normal)
        customButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constraints() {
        label()
        settingsTextView()
        button()
        
        view.addSubview(welcomeLabel)
        view.addSubview(textView)
        view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100),

            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 150),
            customButton.widthAnchor.constraint(equalToConstant: 300),
            customButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
