//
//  GradientView.swift
//  Project052024
//
//  Created by Ахмад Амирович on 05.10.2024.
//

import UIKit

class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.blue.cgColor,
            UIColor.black.cgColor,
            UIColor.blue.cgColor
        ]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        (self.layer.sublayers?.first as? CAGradientLayer)?.frame = self.bounds
    }
}
