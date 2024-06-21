//
//  ChainKava.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/07/19.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainKava459: BaseChain {
    
    var kavaFetcher: KavaFetcher?
    
    override init() {
        super.init()
        
        name = "Kava"
        tag = "kava459"
        logo1 = "chainKava"
        isDefault = false
        apiName = "kava"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/459'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "ukava"
        bechAccountPrefix = "kava"
        validatorPrefix = "kavavaloper"
        grpcHost = "grpc-kava.cosmostation.io"
        
        initFetcher()
    }
    
    override func initFetcher() {
        kavaFetcher = KavaFetcher.init(self)
    }
    
    override func getGrpcfetcher() -> FetcherGrpc? {
        return kavaFetcher
    }
}
