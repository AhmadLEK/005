//
//  Ticker.swift
//  Project052024
//
//  Created by Ахмад Амирович on 09.10.2024.
//

import UIKit

struct Ticker: Codable {
    let ticker: String
    let name: String
    let marketCap: Int
    let branding: Branding

    enum CodingKeys: String, CodingKey {
        case ticker, name
        case marketCap = "market_cap"
        case branding
    }
}

struct Branding: Codable {
    let logoURL: String
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case logoURL = "logo_url"
        case iconURL = "icon_url"
    }
}
