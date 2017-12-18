//
//  CoinAPI.swift
//  Swift4_JSON
//
//  Created by test on 07/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import Foundation

class CoinAPI {
    static let service = CoinAPI()
    
    private static let basePath = "https://api.coinmarketcap.com/v1/"
    
    var currency = ""
    
    func convert(currency: String ,completion: @escaping ([Coin])->() ) {
        
        self.currency = currency
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: getURL(currency: currency)) { (data, response, error) in
            guard let data = data, error == nil else { return }
            do {
                print("fetched coins")
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(coins)
                
            }catch {
                print("decoding error \(error)")
            }
        }
        
        task.resume()
    }
    
    private func getURL( currency: String ) -> URL {
        let path = CoinAPI.basePath + "ticker/?convert="+"\(currency)"+"&limit=100"
        return URL(string: path)!
    }
}
