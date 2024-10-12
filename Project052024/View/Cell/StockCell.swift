//
//  StockCell.swift
//  Project052024
//
//  Created by Ахмад Амирович on 09.10.2024.
//

import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var preMarketLabel: UILabel!
    @IBOutlet weak var brandingImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        brandingImageView.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
