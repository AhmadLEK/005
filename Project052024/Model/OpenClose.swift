//
//  OpenClose.swift
//  Project052024
//
//  Created by Ахмад Амирович on 09.10.2024.
//

import UIKit 

struct OpenClose: Codable {
    let open: Double?
    let high: Double?
    let low: Double?
    let close: Double?
    let afterHours: Double?
    let symbol: String
    let preMarket: Double?
    let volume: Int
    
    enum CodingKeys: String, CodingKey {
        case open, preMarket, high, low, close, afterHours
        case symbol
        case volume
    }
}
