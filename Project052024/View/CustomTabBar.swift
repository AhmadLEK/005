//
//  CustomTabBar.swift
//  Project052024
//
//  Created by Ахмад Амирович on 09.10.2024.
//

import UIKit

class CustomTabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var tabFrame = self.frame
        tabFrame.size.height = 50 // Высота
        tabFrame.size.width = 300 // Ширина
        tabFrame.origin.x = (UIScreen.main.bounds.width - tabFrame.width) / 2 // Центрируем по горизонтали
        tabFrame.origin.y = UIScreen.main.bounds.height - tabFrame.height - 30 // Внизу экрана, отступ снизу
        self.backgroundColor = UIColor(red: 255.0/255.0,
                                       green: 255.0/255.0,
                                       blue: 255.0/255.0,
                                       alpha: 0.3)
        self.layer.cornerRadius = 15
        self.frame = tabFrame
    }
}

