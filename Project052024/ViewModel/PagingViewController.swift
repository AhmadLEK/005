//
//  PagingViewController.swift
//  Project052024
//
//  Created by Ахмад Амирович on 06.10.2024.
//

import UIKit

class PagingViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textHeading: UITextView!
    
    var images = ["photo1", "photo2", "photo3"]
    var headings = ["Create an account",
                    "Market research and analysis",
                    "Stock selection and strategy development"]
    
    var texts = ["Create your account and start trading stocks.",
                 "Pay attention to training and market analysis.",
                 "Stock selection is one of the key points in trading."]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(GradientView(frame: view.bounds))
        updateContent()
        constraints()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentIndex < images.count  - 1 {
            currentIndex += 1
            updateContent()
            
        } else {
            performSegue(withIdentifier: "SetupPIN", sender: self)
        }
        
    }
    
    func updateContent() {
        imageView.image = UIImage(named: images[currentIndex])
        textView.text = texts[currentIndex]
        textHeading.text = headings[currentIndex]
        pageLabel.text = "\(currentIndex + 1)/\(images.count)"
    }
    
    //MARK: settings
    func settingPageLabel() {
        pageLabel.textColor = .white
        pageLabel.textAlignment = .center
        pageLabel.font = UIFont.systemFont(ofSize: 22)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func settingImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func settingsTextHeading() {
        textHeading.textColor = .white
        textHeading.textAlignment = .center
        textHeading.backgroundColor = .clear
        textHeading.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        textHeading.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func settingsTextView() {
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func button() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constraints() {
        settingPageLabel()
        settingImageView()
        settingsTextHeading()
        settingsTextView()
        button()
        
        view.addSubview(pageLabel)
        view.addSubview(imageView)
        view.addSubview(textHeading)
        view.addSubview(textView)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 230),
            
            textHeading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textHeading.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            textHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textHeading.heightAnchor.constraint(equalToConstant: 50),


            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: textHeading.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 150),
            nextButton.widthAnchor.constraint(equalToConstant: 300),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
}
