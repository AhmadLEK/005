//
//  CustomKeyboardView.swift
//  Project052024
//
//  Created by Ахмад Амирович on 07.10.2024.
//

import UIKit

protocol KeyboardViewDelegate: AnyObject {
    func didPressKey(_ key: String)
}

class CustomKeyboardView: UIView {
    
    weak var delegate: KeyboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeyboard()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupKeyboard()
    }
    
    func setupKeyboard() {
        let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "<"]
        let buttonWidth: CGFloat = 135
        let buttonHeight: CGFloat = 75
        
        let gradientLayer = UIColor(red: 21.0/255.0,
                                    green: 21.0/255.0,
                                    blue: 33.0/255.0,
                                    alpha: 1.0)
        
        for (index, key) in keys.enumerated() {
            let button = UIButton(frame: CGRect(x: CGFloat(index % 3) * buttonWidth, y: CGFloat(index / 3) * buttonHeight, width: buttonWidth, height: buttonHeight))
            button.setTitle(key, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.backgroundColor = gradientLayer
            button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
            addSubview(button)
        }

        self.frame.size = CGSize(width: buttonWidth * 3, height: buttonHeight * 4)
    }
    
    @objc private func keyPressed(_ sender: UIButton) {
        guard let key = sender.title(for: .normal) else { return }
        delegate?.didPressKey(key)
    }
}


