//
//  CustomButton.swift
//  Project052024
//
//  Created by Ахмад Амирович on 05.10.2024.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = UIColor(red: 191.0/255.0, 
                                       green: 183.0/255.0,
                                       blue: 253.0/255.0,
                                       alpha: 0.3)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 15
    }
}

