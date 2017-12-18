//
//  CoinTableViewCell.swift
//  Swift4_JSON
//
//  Created by test on 18/12/2017.
//  Copyright © 2017 Grey. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    var coin: Coin? {
        didSet {
            guard let coin = coin else { return }
            self.updateUI(withCoin: coin)
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkText
        label.font = UIFont.boldSystemFont(ofSize: 16)
       // label.backgroundColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
       // label.backgroundColor = UIColor.brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let marketCapLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
       // label.backgroundColor = UIColor.cyan
        label.textAlignment = NSTextAlignment.right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change24Label: UILabel = {
        let label = UILabel()
       // label.backgroundColor = UIColor.darkGray
        label.textAlignment = NSTextAlignment.right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let containerStack = UIStackView(arrangedSubviews: [])
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .horizontal
        containerStack.distribution = .fillEqually
        addSubview(containerStack)
        
        let leftStack = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        leftStack.axis = .vertical
        leftStack.distribution = .fillEqually
        containerStack.addArrangedSubview(leftStack)
        
        let rightStack = UIStackView(arrangedSubviews: [marketCapLabel, change24Label])
        rightStack.axis = .vertical
        rightStack.distribution = .fillEqually
        containerStack.addArrangedSubview(rightStack)
        
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func updateUI(withCoin coin: Coin) {
        nameLabel.text = coin.name
        priceLabel.text = "$\(coin.price_usd)"
        
        marketCapLabel.text = "$\(coin.market_cap_usd)"
        
        if let change = Double(coin.percent_change_24h) {
            change24Label.textColor = change < 0.0 ? UIColor.red : UIColor.green
            change24Label.text = "\(change)%"
        }
    }
}
