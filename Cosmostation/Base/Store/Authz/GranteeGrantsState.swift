//
//  GranteeGrantsState.swift
//  Cosmostation
//
//  Created by albertopeam on 30/12/22.
//  Copyright © 2022 wannabit. All rights reserved.
//

import Foundation

struct GranteeGrantsState: State {
    enum LoadState {
        case notLoading
        case loading
        case refreshing
        
        var isLoading: Bool {
            if case .loading = self {
                return true
            }
            return false
        }
        
        var isRefreshing: Bool {
            if case .refreshing = self {
                return true
            }
            return false
        }
    }
    let load: LoadState
    let granters: [String]
    
    init() {
        load = .notLoading
        granters = []
    }
    
    init(load: LoadState, granters: [String]) {
        self.load = load
        self.granters = granters
    }
}