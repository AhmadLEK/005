//
//  StocksViewController.swift
//  Project052024
//
//  Created by Ахмад Амирович on 08.10.2024.
//

import UIKit

class StocksViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tickers: [Ticker] = []
    var openCloseData: [OpenClose] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.register(
//            UINib(
//                nibName: "StockCell",
//                bundle: nil),
//            forCellReuseIdentifier: "stockCell")
        view.addSubview(GradientView(frame: view.bounds))
        tableView.addSubview(GradientView(frame: view.bounds))

        tableView.delegate = self
        tableView.dataSource = self
        fetchTickers()
    }
    
    func fetchTickers() {
        NetworkManager.shared.fetchTickers { [weak self] tickers in
            guard let self = self, let tickers else { return }
            
            let dispatchGroop = DispatchGroup()
            for i in 0..<min(20, tickers.count) {
                dispatchGroop.enter()
                NetworkManager.shared.fetchOpenClose(forTicker: tickers[i].ticker) { openClose in
                    if let openClose = openClose {
                        self.openCloseData.append(openClose)
                    }
                    dispatchGroop.leave()
                }
            }
            dispatchGroop.notify(queue: .main) {
                self.tableView.reloadData()
            }
        }
    }
}

extension StocksViewController: UITableViewDataSource, UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(tickers.count, openCloseData.count)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as? StockCell
        else {
            return UITableViewCell()
        }
        
        let ticker = tickers[indexPath.row]
        let openClose = openCloseData[indexPath.row]
        
        cell.tickerLabel.text = ticker.ticker
        cell.nameLabel.text = ticker.name
        cell.marketCapLabel.text = "$\(ticker.marketCap)"
        //cell.openLabel.text = "Open: \(openClose.open ?? 0)"
        cell.preMarketLabel.text = "Pre-Maeket: \(String(describing: openClose.preMarket))"
        //cell.brandingImageView.image = UIImage(named: "\(ticker.branding)")
        
        return cell
    }
    
    
}
