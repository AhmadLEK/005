//
//  SetupPINViewController.swift
//  Project052024
//
//  Created by Ахмад Амирович on 07.10.2024.
//

import UIKit

class SetupPINViewController: UIViewController, KeyboardViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var setupPin: UILabel!
    @IBOutlet weak var textLabel: UITextView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var skip: UIButton!
    
    let keyboardView = CustomKeyboardView()
    var inputDigits = [String]()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(GradientView(frame: view.bounds))
        setupUI()
        updateUI()
        setupKeyboardView()
        constraints()
    }

    private func setupKeyboardView() {
        keyboardView.delegate = self
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardView)
    }
    
    
    func didPressKey(_ key: String) {
        if key == "<" {
            if !inputDigits.isEmpty {
                inputDigits.removeLast()
            }
        } else {
            if inputDigits.count < 4 {
                inputDigits.append(key)
            }
        }
        //updateDisplay()
        setupCircles()
    }

//    private func updateDisplay() {
//        let displayString = inputDigits.map { _ in "X" }.joined()
//        codeLabel.text = displayString
//    }
    
    func setupCircles() {
        let circleSize: CGFloat = 25.0
        let colors: [UIColor] = [.blue, .blue, .blue, .blue]
        
        for i in 0..<4 {
            let circleView = UIView()
            circleView.backgroundColor = colors[i]
            circleView.layer.cornerRadius = circleSize / 2
            circleView.frame = CGRect(x: 120 + (circleSize + 20) * CGFloat(i), y: 500, width: circleSize, height: circleSize)
            
            view.addSubview(circleView)
        }
    }
    
    func updateUI() {
        imageView.image = UIImage(named: "castle")
        setupPin.text = "Setup PIN"
        textLabel.text = "Enter your PIN number"
        
    }
    
    //MARK: setting
    private func setupUI() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        skip.setTitle("Skip", for: .normal)
        skip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skip)
        
        setupPin.textColor = .white
        setupPin.textAlignment = .center
        setupPin.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        setupPin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setupPin)
        
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .clear
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
//        codeLabel.text = ""
//        codeLabel.backgroundColor = .clear
//        codeLabel.textColor = .white
//        codeLabel.textAlignment = .center
//        codeLabel.layer.cornerRadius = 5
//        codeLabel.clipsToBounds = true
//        view.addSubview(codeLabel)
    }
    
    //MARK: constraints
    private func constraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            
            skip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            skip.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            setupPin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setupPin.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            setupPin.heightAnchor.constraint(equalToConstant: 50),

            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: setupPin.bottomAnchor, constant: 10),
            textLabel.heightAnchor.constraint(equalToConstant: 100),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),


//            codeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            codeLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15),
//            codeLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            keyboardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardView.widthAnchor.constraint(equalToConstant: view.frame.width),
            keyboardView.heightAnchor.constraint(equalToConstant: 300),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
