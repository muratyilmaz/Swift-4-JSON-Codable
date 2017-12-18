//
//  CoinListViewModel.swift
//  Swift4_JSON
//
//  Created by test on 18/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class CoinListViewModel: NSObject {
    
    var coins = [Coin]()
    
    override init() {
        super.init()
    }
    
    func fetchCoins(completion: @escaping ()->()) {
        CoinAPI.service.convert(currency: "BTC") { [weak self] coins in
            guard let weakSelf = self else { return }
            weakSelf.coins = coins.sorted(by: { return $0.rankInt < $1.rankInt })
            completion()
        }
    }
    
    func coin(at index:Int) -> Coin {
        return coins[index]
    }
}
