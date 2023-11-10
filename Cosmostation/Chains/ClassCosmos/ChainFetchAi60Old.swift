//
//  ChainFetchAi60Old.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/11/10.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainFetchAi60Old: CosmosClass  {
    
    override init() {
        super.init()
        
        isDefault = false
        name = "Fetch.Ai"
        tag = "fetchai60_Old"
        logo1 = "chainFetchAi"
        logo2 = "chainFetchAi2"
        apiName = "fetchai"
        stakeDenom = "afet"
        
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/60'/0'/X")
        bechAccountPrefix = "fetch"
        
        grpcHost = "grpc-fetchai.cosmostation.io"
    }
    
}
