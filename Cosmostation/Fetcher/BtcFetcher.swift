//
//  BtcFetcher.swift
//  Cosmostation
//
//  Created by yongjoo jung on 8/22/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class BtcFetcher {
    
    var chain: BaseChain!
    
    var btcBalances = NSDecimalNumber.zero
    var btcPendingInput = NSDecimalNumber.zero
    var btcPendingOutput = NSDecimalNumber.zero
    
    init(_ chain: BaseChain) {
        self.chain = chain
    }
    
    func fetchBtcBalances() async -> Bool {
        if let balance = try? await fetchBalance(chain.mainAddress) {
            print("balance ", balance)
        }
        return true
    }
    
    func fetchBtcData(_ id: Int64) async -> Bool {
        btcBalances = NSDecimalNumber.zero
        btcPendingInput  = NSDecimalNumber.zero
        btcPendingOutput = NSDecimalNumber.zero
        
        do {
            if let stats = try await fetchBalance(chain.mainAddress) {
                guard let addresss = stats["address"].string, addresss == chain.mainAddress else {
                    print("fetchBtc error no address")
                    return false
                }
                let chain_funded_txo_sum = NSDecimalNumber(value: stats["chain_stats"]["funded_txo_sum"].uInt64Value)
                let chain_spent_txo_sum = NSDecimalNumber(value: stats["chain_stats"]["spent_txo_sum"].uInt64Value)
                let mempool_funded_txo_sum = NSDecimalNumber(value: stats["mempool_stats"]["funded_txo_sum"].uInt64Value)
                let mempool_spent_txo_sum = NSDecimalNumber(value: stats["mempool_stats"]["funded_txo_sum"].uInt64Value)
                
                btcBalances = chain_funded_txo_sum.subtracting(chain_spent_txo_sum).subtracting(mempool_spent_txo_sum)
                btcPendingInput = mempool_funded_txo_sum
                btcPendingOutput = mempool_spent_txo_sum
                
                print("", chain.mainAddress, "   ", btcBalances)
            }
            return true
            
        } catch {
            print("fetchBtc error \(error) ", chain.tag)
            return false
        }
    }
    
    
    func allValue(_ usd: Bool? = false) -> NSDecimalNumber {
        let msPrice = BaseData.instance.getPrice(chain.coinGeckoId, usd)
        return btcBalances.multiplying(by: msPrice).multiplying(byPowerOf10: -8, withBehavior: handler6)
    }
    
    
    func mempoolUrl() -> String {
        if (chain.isTestnet) {
            return "https://mempool.space/signet/api/"
        }
        return "https://mempool.space/api/"
    }
}




extension BtcFetcher {
    
    func fetchBalance(_ address: String) async throws -> JSON? {
        let url = mempoolUrl() + "address/" + address
        print("url ", url)
        return try? await AF.request(url, method: .get).serializingDecodable(JSON.self).value
    }
    
    func fetchUtxos(_ address: String) async throws -> JSON? {
        let url = mempoolUrl() + "address/" + address + "/utxo"
        return try? await AF.request(url, method: .get).serializingDecodable(JSON.self).value
    }
}
