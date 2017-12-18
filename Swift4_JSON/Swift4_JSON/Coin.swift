//
//  Coin.swift
//  Swift4_JSON
//
//  Created by test on 07/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import Foundation

struct Coin: Decodable, CustomStringConvertible {

    var description: String {
        return "\(id) - \(name) - \(symbol) - \(rank) \(market_cap)"
    }
    
    var rankInt: Int {
        get {
            return Int(rank)!        
        }
    }
    
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var price_usd: String
    var price_btc: String
    var volumeUsdIn24h: String
    var market_cap_usd: String
    var available_supply: String
    var total_supply: String
    var max_supply: String?
    var percent_change_1h: String
    var percent_change_24h: String
    var percent_change_7d: String
    var last_updated: String
    var market_cap: String
    
    struct CodingKeys: CodingKey {
        var intValue: Int?
        var stringValue: String
        
        init?(intValue: Int) { self.intValue = intValue; self.stringValue = "\(intValue)" }
        init?(stringValue: String) { self.stringValue = stringValue }
        
        static let id = CodingKeys(stringValue: "id")!
        static let name = CodingKeys(stringValue: "name")!
        static let symbol = CodingKeys(stringValue: "symbol")!
        static let rank = CodingKeys(stringValue: "rank")!
        static let price_usd = CodingKeys(stringValue: "price_usd")!
        static let price_btc = CodingKeys(stringValue: "price_btc")!
        static let volumeUsdIn24h = CodingKeys(stringValue: "24h_volume_usd")!
        static let market_cap_usd = CodingKeys(stringValue: "market_cap_usd")!
        static let available_supply = CodingKeys(stringValue: "available_supply")!
        static let total_supply = CodingKeys(stringValue: "total_supply")!
        static let max_supply = CodingKeys(stringValue: "max_supply")!
        static let percent_change_1h = CodingKeys(stringValue: "percent_change_1h")!
        static let percent_change_24h = CodingKeys(stringValue: "percent_change_24h")!
        static let percent_change_7d = CodingKeys(stringValue: "percent_change_7d")!
        static let last_updated = CodingKeys(stringValue: "last_updated")!
        
        static func makeKey(name: String) -> CodingKeys {
            return CodingKeys(stringValue: name)!
        }
    }
    
    public init(from decoder: Decoder) throws {

        let map = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try map.decode(String.self, forKey: .id)
        self.name = try map.decode(String.self, forKey: .name)
        self.symbol = try map.decode(String.self, forKey: .symbol)
        self.rank = try map.decode(String.self, forKey: .rank)
        self.price_usd = try map.decode(String.self, forKey: .price_usd)
        self.price_btc = try map.decode(String.self, forKey: .price_btc)
        self.volumeUsdIn24h = try map.decode(String.self, forKey: .volumeUsdIn24h)
        self.market_cap_usd = try map.decode(String.self, forKey: .market_cap_usd)
        self.available_supply = try map.decode(String.self, forKey: .available_supply)
        self.total_supply = try map.decode(String.self, forKey: .total_supply)
        self.max_supply = try map.decodeIfPresent(String.self, forKey: .max_supply)
        self.percent_change_1h = try map.decode(String.self, forKey: .percent_change_1h)
        self.percent_change_24h = try map.decode(String.self, forKey: .percent_change_24h)
        self.percent_change_7d = try map.decode(String.self, forKey: .percent_change_7d)
        self.last_updated = try map.decode(String.self, forKey: .last_updated)
        
        self.market_cap = try map.decode(String.self, forKey: .makeKey(name: "market_cap_\(CoinAPI.service.currency.lowercased())"))
    }
}
