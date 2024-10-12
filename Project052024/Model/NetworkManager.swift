//
//  NetworkManager.swift
//  Project052024
//
//  Created by Ахмад Амирович on 09.10.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let apiKey = "QT9oDnHsfiptRu_VaZoOazZA4WuDGROQ"
    
    func fetchTickers(completion: @escaping ([Ticker]?) -> Void) {
        let urlString = "https://api.polygon.io/v3/reference/tickers?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching tickers: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode([Ticker].self, from: data)
                completion(results)
            } catch {
                print("Error decoding tickers: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchOpenClose(forTicker ticker: String, completion: @escaping (OpenClose?) -> Void) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let urlString = "https://api.polygon.io/v1/open-close/\(ticker)/\(date)?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching open/close data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(OpenClose.self, from: data)
                completion(result)
            } catch {
                print("Error decoding open/close data: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
}
