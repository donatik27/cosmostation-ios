//
//  Signer.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/12/14.
//  Copyright © 2020 wannabit. All rights reserved.
//

import Foundation
import SwiftProtobuf
import SwiftyJSON
import Web3Core
import secp256k1

class Signer {
    //Tx for Transfer
    static func genSendTx(_ account: Google_Protobuf_Any,
                          _ toSend: Cosmos_Bank_V1beta1_MsgSend,
                          _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain)  -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let sendMsg = genSendMsg(toSend)
        return getSignedTxA(account, sendMsg, fee, memo, baseChain)
    }
    
    static func genSendSimul(_ account: Google_Protobuf_Any,
                             _ toSend: Cosmos_Bank_V1beta1_MsgSend,
                             _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain)  -> Cosmos_Tx_V1beta1_SimulateRequest {
        let sendMsg = genSendMsg(toSend)
        return getSimulateTxA(account, sendMsg, fee, memo, baseChain)
    }
    
    static func genSendMsg(_ toSend: Cosmos_Bank_V1beta1_MsgSend) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.bank.v1beta1.MsgSend"
            $0.value = try! toSend.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Ibc Transfer
    static func genIbcSendTx(_ account: Google_Protobuf_Any,
                             _ ibcTransfer: Ibc_Applications_Transfer_V1_MsgTransfer,
                             _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let ibcSendMsg = genIbcSendMsg(ibcTransfer)
        return getSignedTxA(account, ibcSendMsg, fee, memo, baseChain)
    }
    
    static func genIbcSendSimul(_ account: Google_Protobuf_Any,
                                _ ibcTransfer: Ibc_Applications_Transfer_V1_MsgTransfer,
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let ibcSendMsg = genIbcSendMsg(ibcTransfer)
        return getSimulateTxA(account, ibcSendMsg, fee, memo, baseChain)
    }
    
    static func genIbcSendMsg(_ ibcTransfer: Ibc_Applications_Transfer_V1_MsgTransfer) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/ibc.applications.transfer.v1.MsgTransfer"
            $0.value = try! ibcTransfer.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Wasm Exe
    static func genWasmTx(_ account: Google_Protobuf_Any,
                          _ wasmContracts: [Cosmwasm_Wasm_V1_MsgExecuteContract],
                          _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let wasmMsg = genWasmMsg(wasmContracts)
        return getSignedTxA(account, wasmMsg, fee, memo, baseChain)
    }
    
    static func genWasmSimul(_ account: Google_Protobuf_Any,
                             _ wasmContracts: [Cosmwasm_Wasm_V1_MsgExecuteContract],
                             _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let wasmMsg = genWasmMsg(wasmContracts)
        return getSimulateTxA(account, wasmMsg, fee, memo, baseChain)
    }
    
    static func genWasmMsg(_ wasmContracts: [Cosmwasm_Wasm_V1_MsgExecuteContract]) -> [Google_Protobuf_Any] {
        var result = [Google_Protobuf_Any]()
        wasmContracts.forEach { msg in
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmwasm.wasm.v1.MsgExecuteContract"
                $0.value = try! msg.serializedData()
            }
            result.append(anyMsg)
        }
        return result
    }
    
    //Tx for Common Delegate
    static func genDelegateTx(_ account: Google_Protobuf_Any,
                              _ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate,
                              _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let deleMsg = genDelegateMsg(toDelegate)
        return getSignedTxA(account, deleMsg, fee, memo, baseChain)
    }
    
    static func genDelegateSimul(_ account: Google_Protobuf_Any,
                                 _ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate,
                                 _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let deleMsg = genDelegateMsg(toDelegate)
        return getSimulateTxA(account, deleMsg, fee, memo, baseChain)
    }
    
    static func genDelegateMsg(_ toDelegate: Cosmos_Staking_V1beta1_MsgDelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
            $0.value = try! toDelegate.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Common UnDelegate
    static func genUndelegateTx(_ account: Google_Protobuf_Any,
                                _ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate,
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let undeleMsg = genUndelegateMsg(toUndelegate)
        return getSignedTxA(account, undeleMsg, fee, memo, baseChain)
    }
    
    static func genUndelegateSimul(_ account: Google_Protobuf_Any,
                                   _ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let undeleMsg = genUndelegateMsg(toUndelegate)
        return getSimulateTxA(account, undeleMsg, fee, memo, baseChain)
    }
    
    static func genUndelegateMsg(_ toUndelegate: Cosmos_Staking_V1beta1_MsgUndelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgUndelegate"
            $0.value = try! toUndelegate.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Common CancelUnbonding
    static func genCancelUnbondingTx(_ account: Google_Protobuf_Any,
                                     _ toCancel: Cosmos_Staking_V1beta1_MsgCancelUnbondingDelegation,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let cancelMsg = genCancelUnbondingMsg(toCancel)
        return getSignedTxA(account, cancelMsg, fee, memo, baseChain)
    }
    
    static func genCancelUnbondingSimul(_ account: Google_Protobuf_Any,
                                        _ toCancel: Cosmos_Staking_V1beta1_MsgCancelUnbondingDelegation,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let cancelMsg = genCancelUnbondingMsg(toCancel)
        return getSimulateTxA(account, cancelMsg, fee, memo, baseChain)
    }
    
    static func genCancelUnbondingMsg(_ toCancel: Cosmos_Staking_V1beta1_MsgCancelUnbondingDelegation) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgCancelUnbondingDelegation"
            $0.value = try! toCancel.serializedData()
        }
        return [anyMsg]
    }
    
    
    //Tx for Common ReDelegate
    static func genRedelegateTx(_ account: Google_Protobuf_Any,
                                _ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate,
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let redeleMsg = genRedelegateMsg(toRedelegate)
        return getSignedTxA(account, redeleMsg, fee, memo, baseChain)
    }
    
    static func genRedelegateSimul(_ account: Google_Protobuf_Any,
                                   _ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let redeleMsg = genRedelegateMsg(toRedelegate)
        return getSimulateTxA(account, redeleMsg, fee, memo, baseChain)
    }
    
    static func genRedelegateMsg(_ toRedelegate: Cosmos_Staking_V1beta1_MsgBeginRedelegate) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.staking.v1beta1.MsgBeginRedelegate"
            $0.value = try! toRedelegate.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Common Claim Staking Rewards
    static func genClaimRewardsTx(_ account: Google_Protobuf_Any,
                                  _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                  _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest  {
        let claimRewardMsg = genClaimStakingRewardMsg(account, rewards)
        return getSignedTxA(account, claimRewardMsg, fee, memo, baseChain)
    }
    
    static func genClaimRewardsSimul(_ account: Google_Protobuf_Any,
                                     _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let claimRewardMsg = genClaimStakingRewardMsg(account, rewards)
        return getSimulateTxA(account, claimRewardMsg, fee, memo, baseChain)
    }
    
    static func genClaimStakingRewardMsg(_ account: Google_Protobuf_Any, _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward]) -> [Google_Protobuf_Any] {
        var anyMsgs = [Google_Protobuf_Any]()
        for reward in rewards {
            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
                $0.delegatorAddress = account.accountInfos().0!
                $0.validatorAddress = reward.validatorAddress
            }
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
                $0.value = try! claimMsg.serializedData()
            }
            anyMsgs.append(anyMsg)
        }
        return anyMsgs
    }
    
    //Tx for Common Claim Commission
    static func genClaimCommissionTx(_ account: Google_Protobuf_Any,
                                     _ commission: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest  {
        let claimCommissionMsg = genClaimCommissionMsg(commission)
        return getSignedTxA(account, claimCommissionMsg, fee, memo, baseChain)
    }
    
    static func genClaimCommissionSimul(_ account: Google_Protobuf_Any,
                                        _ commission: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let claimCommissionMsg = genClaimCommissionMsg(commission)
        return getSimulateTxA(account, claimCommissionMsg, fee, memo, baseChain)
    }
    
    static func genClaimCommissionMsg(_ commission: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission"
            $0.value = try! commission.serializedData()
        }
        return [anyMsg]
    }
    
    
    //Tx for Common Re-Invest
    static func genCompoundingTx(_ account: Google_Protobuf_Any,
                                 _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                 _ stakingDenom: String,
                                 _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let reinvestMsg = genCompoundingMsg(account, rewards, stakingDenom)
        return getSignedTxA(account, reinvestMsg, fee, memo, baseChain)
    }
    
    static func genCompoundingSimul(_ account: Google_Protobuf_Any,
                                    _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                    _ stakingDenom: String,
                                    _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let reinvestMsg = genCompoundingMsg(account, rewards, stakingDenom)
        return getSimulateTxA(account, reinvestMsg, fee, memo, baseChain)
    }
    
    static func genCompoundingMsg(_ account: Google_Protobuf_Any,
                                  _ rewards: [Cosmos_Distribution_V1beta1_DelegationDelegatorReward],
                                  _ stakingDenom: String) -> [Google_Protobuf_Any] {
        var anyMsgs = [Google_Protobuf_Any]()
        rewards.forEach { reward in
            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
                $0.delegatorAddress = account.accountInfos().0!
                $0.validatorAddress = reward.validatorAddress
            }
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
                $0.value = try! claimMsg.serializedData()
            }
            anyMsgs.append(anyMsg)
            
            let rewardCoin = reward.reward.filter({ $0.denom == stakingDenom }).first
            let deleCoin = Cosmos_Base_V1beta1_Coin.with {
                $0.denom = rewardCoin!.denom
                $0.amount = NSDecimalNumber.init(string: rewardCoin!.amount).multiplying(byPowerOf10: -18, withBehavior: handler0Down).stringValue
            }
            let deleMsg = Cosmos_Staking_V1beta1_MsgDelegate.with {
                $0.delegatorAddress = account.accountInfos().0!
                $0.validatorAddress = reward.validatorAddress
                $0.amount = deleCoin
            }
            let deleAnyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
                $0.value = try! deleMsg.serializedData()
            }
            anyMsgs.append(deleAnyMsg)
        }
        return anyMsgs
    }
    
    //Tx for Common Vote
    static func genVotesTx(_ account: Google_Protobuf_Any, _ votes: [Cosmos_Gov_V1beta1_MsgVote],
                           _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let voteMsg = genVoteMsg(votes)
        return getSignedTxA(account, voteMsg, fee, memo, baseChain)
    }
    
    static func genVotesSimul(_ account: Google_Protobuf_Any, _ votes: [Cosmos_Gov_V1beta1_MsgVote],
                              _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let voteMsg = genVoteMsg(votes)
        return getSimulateTxA(account, voteMsg, fee, memo, baseChain)
    }
    
    static func genVoteMsg(_ votes: [Cosmos_Gov_V1beta1_MsgVote]) -> [Google_Protobuf_Any] {
        var anyMsgs = Array<Google_Protobuf_Any>()
        votes.forEach { vote in
            let anyMsg = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.gov.v1beta1.MsgVote"
                $0.value = try! vote.serializedData()
            }
            anyMsgs.append(anyMsg)
        }
        return anyMsgs
    }
    
    //Tx for Common Reward Address Change
    static func genRewardAddressTx(_ account: Google_Protobuf_Any,
                                   _ setAddress: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let setRewardAddressMsg = genRewardAddressMsg(setAddress)
        return getSignedTxA(account, setRewardAddressMsg, fee, memo, baseChain)
    }
    
    static func genRewardAddressTxSimul(_ account: Google_Protobuf_Any,
                                        _ setAddress: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let setRewardAddressMsg = genRewardAddressMsg(setAddress)
        return getSimulateTxA(account, setRewardAddressMsg, fee, memo, baseChain)
    }
    
    static func genRewardAddressMsg(_ setAddress: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/cosmos.distribution.v1beta1.MsgSetWithdrawAddress"
            $0.value = try! setAddress.serializedData()
        }
        return [anyMsg]
    }
    
//
//    //for Osmosis custom msgs
//    //Tx for Osmosis Swap In
//    static func genSignedSwapInMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute], _ inputDenom: String, _ inputAmount: String, _ outputAmount: String,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let SwapInMsg = genSwapInMsg(auth, swapRoutes, inputDenom, inputAmount, outputAmount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, SwapInMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSwapInMsgTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute], _ inputDenom: String, _ inputAmount: String, _ outputAmount: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let SwapInMsg = genSwapInMsg(auth, swapRoutes, inputDenom, inputAmount, outputAmount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, SwapInMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSwapInMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ swapRoutes: [Osmosis_Poolmanager_V1beta1_SwapAmountInRoute],
//                             _ inputDenom: String, _ inputAmount: String, _ outputAmount: String) -> [Google_Protobuf_Any] {
//        let inputCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = inputDenom
//            $0.amount = inputAmount
//        }
//        let swapMsg = Osmosis_Gamm_V1beta1_MsgSwapExactAmountIn.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.routes = swapRoutes
//            $0.tokenIn = inputCoin
//            $0.tokenOutMinAmount = outputAmount
//            
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/osmosis.gamm.v1beta1.MsgSwapExactAmountIn"
//            $0.value = try! swapMsg.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//
    
//    //for IRIS custom msgs
//    //Tx for Iris Issue Nft
//    static func genSignedIssueNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisIssueNft = genIrisIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisIssueNft = genIrisIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisIssueNft(_ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let issueNftDenom = Irismod_Nft_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//            $0.symbol = ""
//            $0.mintRestricted = false
//            $0.updateRestricted = false
//        }
//        let issueNftDenomMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgIssueDenom"
//            $0.value = try! issueNftDenom.serializedData()
//        }
//        anyMsgs.append(issueNftDenomMsg)
//        let issueNft = Irismod_Nft_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = signer
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = name
//            $0.uri = uri
//            $0.data = data
//        }
//        let issueNftMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgMintNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        anyMsgs.append(issueNftMsg)
//        return anyMsgs
//    }
//    
//    //Tx for Iris Send Nft
//    static func genSignedSendNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisSendNft = genIrisSendNft(signer, recipient, id, denom_id, irisResponse)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSendNftIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                             _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse,
//                                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisSendNft = genIrisSendNft(signer, recipient, id, denom_id, irisResponse)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisSendNft(_ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ irisResponse: Irismod_Nft_QueryNFTResponse) -> [Google_Protobuf_Any] {
//        let issueNft = Irismod_Nft_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = recipient
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = irisResponse.nft.name
//            $0.uri = irisResponse.nft.uri
//            $0.data = irisResponse.nft.data
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgTransferNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Iris Issue Nft Denom
//    static func genSignedIssueNftDenomIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                 _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let irisIssueNftDenom = genIrisIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, irisIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftDenomIrisTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                   _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let irisIssueNftDenom = genIrisIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, irisIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genIrisIssueNftDenom(_ signer: String,_ denom_id: String, _ denom_name: String) -> [Google_Protobuf_Any] {
//        let issueNft = Irismod_Nft_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//            $0.symbol = ""
//            $0.mintRestricted = false
//            $0.updateRestricted = false
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/irismod.nft.MsgIssueDenom"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //for CRO custom msgs
//    //Tx for Cro Issue Nft
//    static func genSignedIssueNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croIssueNft = genCroIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                             _ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String,
//                                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croIssueNft = genCroIssueNft(signer, denom_id, denom_name, id, name, uri, data)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croIssueNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroIssueNft(_ signer: String, _ denom_id: String, _ denom_name: String,  _ id: String, _ name: String, _ uri: String, _ data: String) -> [Google_Protobuf_Any] {
//        var anyMsgs = Array<Google_Protobuf_Any>()
//        let issueNftDenom = Chainmain_Nft_V1_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//        }
//        let issueNftDenomMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgIssueDenom"
//            $0.value = try! issueNftDenom.serializedData()
//        }
//        anyMsgs.append(issueNftDenomMsg)
//        let issueNft = Chainmain_Nft_V1_MsgMintNFT.with {
//            $0.sender = signer
//            $0.recipient = signer
//            $0.id = id
//            $0.denomID = denom_id
//            $0.name = name
//            $0.uri = uri
//            $0.data = data
//        }
//        let issueNftMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgMintNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        anyMsgs.append(issueNftMsg)
//        return anyMsgs
//    }
//    
//    //Tx for Cro Send Nft
//    static func genSignedSendNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                          _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse,
//                                          _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croSendNft = genCroSendNft(signer, recipient, id, denom_id, croResponse)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateSendNftCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croSendNft = genCroSendNft(signer, recipient, id, denom_id, croResponse)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croSendNft, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroSendNft(_ signer: String, _ recipient: String, _ id: String, _ denom_id: String, _ croResponse: Chainmain_Nft_V1_QueryNFTResponse) -> [Google_Protobuf_Any] {
//        let issueNft = Chainmain_Nft_V1_MsgTransferNFT.with {
//            $0.sender = signer
//            $0.recipient = recipient
//            $0.id = id
//            $0.denomID = denom_id
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgTransferNFT"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Cro Issue Nft Denom
//    static func genSignedIssueNftDenomCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let croIssueNftDenom = genCroIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, croIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateIssueNftDenomCroTxgRPC(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                  _ signer: String,_ denom_id: String, _ denom_name: String,
//                                                  _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let croIssueNftDenom = genCroIssueNftDenom(signer, denom_id, denom_name)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, croIssueNftDenom, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genCroIssueNftDenom(_ signer: String,_ denom_id: String, _ denom_name: String) -> [Google_Protobuf_Any] {
//        let issueNft = Chainmain_Nft_V1_MsgIssueDenom.with {
//            $0.id = denom_id
//            $0.name = denom_name
//            $0.schema = ""
//            $0.sender = signer
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/chainmain.nft.v1.MsgIssueDenom"
//            $0.value = try! issueNft.serializedData()
//        }
//        return [anyMsg]
//    }
    
    //for kava sign
    //Tx for Kava CDP Create
    static func genKavaCDPCreateTx(_ account: Google_Protobuf_Any,
                                   _ toCreate: Kava_Cdp_V1beta1_MsgCreateCDP,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let toCreateMsg = genKavaCDPCreateMsg(toCreate)
        return getSignedTxA(account, toCreateMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPCreateSimul(_ account: Google_Protobuf_Any,
                                      _ toCreate: Kava_Cdp_V1beta1_MsgCreateCDP,
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let toCreateMsg = genKavaCDPCreateMsg(toCreate)
        return getSimulateTxA(account, toCreateMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPCreateMsg(_ toCreate: Kava_Cdp_V1beta1_MsgCreateCDP) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.cdp.v1beta1.MsgCreateCDP"
            $0.value = try! toCreate.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava CDP Deposit
    static func genKavaCDPDepositTx(_ account: Google_Protobuf_Any,
                                    _ toDeposit: Kava_Cdp_V1beta1_MsgDeposit,
                                    _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let toDepositMsg = genKavaCDPDepositMsg(toDeposit)
        return getSignedTxA(account, toDepositMsg, fee, memo, baseChain)
    }
    
    static func KavaCDPDepositSimul(_ account: Google_Protobuf_Any,
                                    _ toDeposit: Kava_Cdp_V1beta1_MsgDeposit,
                                    _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let toDepositMsg = genKavaCDPDepositMsg(toDeposit)
        return getSimulateTxA(account, toDepositMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPDepositMsg(_ toDeposit: Kava_Cdp_V1beta1_MsgDeposit) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.cdp.v1beta1.MsgDeposit"
            $0.value = try! toDeposit.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava CDP Withdraw
    static func genKavaCDPWithdrawTx(_ account: Google_Protobuf_Any,
                                     _ toWithdraw: Kava_Cdp_V1beta1_MsgWithdraw,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let toWithdrawMsg = genKavaCDPWithdrawMsg(toWithdraw)
        return getSignedTxA(account, toWithdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPWithdrawSimul(_ account: Google_Protobuf_Any,
                                        _ toWithdraw: Kava_Cdp_V1beta1_MsgWithdraw,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let toWithdrawMsg = genKavaCDPWithdrawMsg(toWithdraw)
        return getSimulateTxA(account, toWithdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPWithdrawMsg(_ toWithdraw: Kava_Cdp_V1beta1_MsgWithdraw) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.cdp.v1beta1.MsgWithdraw"
            $0.value = try! toWithdraw.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava CDP Draw Debt
    static func genKavaCDPDrawDebtTx(_ account: Google_Protobuf_Any,
                                     _ toDrawDebt: Kava_Cdp_V1beta1_MsgDrawDebt,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let drawMsg = genKavaCDPDrawMsg(toDrawDebt)
        return getSignedTxA(account, drawMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPDrawDebtSimul(_ account: Google_Protobuf_Any,
                                        _ toDrawDebt: Kava_Cdp_V1beta1_MsgDrawDebt,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let drawMsg = genKavaCDPDrawMsg(toDrawDebt)
        return getSimulateTxA(account, drawMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPDrawMsg(_ toDrawDebt: Kava_Cdp_V1beta1_MsgDrawDebt) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.cdp.v1beta1.MsgDrawDebt"
            $0.value = try! toDrawDebt.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava CDP Repay
    static func genKavaCDPRepayTx(_ account: Google_Protobuf_Any,
                                  _ toRepay: Kava_Cdp_V1beta1_MsgRepayDebt,
                                  _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let repayMsg = genKavaCDPRepayMsg(toRepay)
        return getSignedTxA(account, repayMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPRepaySimul(_ account: Google_Protobuf_Any,
                                     _ toRepay: Kava_Cdp_V1beta1_MsgRepayDebt,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let repayMsg = genKavaCDPRepayMsg(toRepay)
        return getSimulateTxA(account, repayMsg, fee, memo, baseChain)
    }
    
    static func genKavaCDPRepayMsg(_ toRepay: Kava_Cdp_V1beta1_MsgRepayDebt) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.cdp.v1beta1.MsgRepayDebt"
            $0.value = try! toRepay.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Hard Deposit
    static func genKavaHardDepositTx(_ account: Google_Protobuf_Any,
                                     _ toDeposit: Kava_Hard_V1beta1_MsgDeposit,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let depositMsg = genKavaHardDepositMsg(toDeposit)
        return getSignedTxA(account, depositMsg, fee, memo, baseChain)
    }
    
    static func geKavaHardDepositSimul(_ account: Google_Protobuf_Any,
                                       _ toDeposit: Kava_Hard_V1beta1_MsgDeposit,
                                       _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let depositMsg = genKavaHardDepositMsg(toDeposit)
        return getSimulateTxA(account, depositMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardDepositMsg(_ toDeposit: Kava_Hard_V1beta1_MsgDeposit) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.hard.v1beta1.MsgDeposit"
            $0.value = try! toDeposit.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Hard Withdraw
    static func genKavaHardwithdrawTx(_ account: Google_Protobuf_Any,
                                      _ toWithdraw: Kava_Hard_V1beta1_MsgWithdraw,
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let withdrawMsg = genKavaHardWithdrawMsg(toWithdraw)
        return getSignedTxA(account, withdrawMsg, fee, memo, baseChain)
    }
    
    static func geKavaHardWithdrawSimul(_ account: Google_Protobuf_Any,
                                        _ toWithdraw: Kava_Hard_V1beta1_MsgWithdraw,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let withdrawMsg = genKavaHardWithdrawMsg(toWithdraw)
        return getSimulateTxA(account, withdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardWithdrawMsg(_ toWithdraw: Kava_Hard_V1beta1_MsgWithdraw) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.hard.v1beta1.MsgWithdraw"
            $0.value = try! toWithdraw.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Hard Borrow
    static func genKavaHardBorrowTx(_ account: Google_Protobuf_Any,
                                    _ toBorrow: Kava_Hard_V1beta1_MsgBorrow,
                                    _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let borrowMsg = genKavaHardBorrowMsg(toBorrow)
        return getSignedTxA(account, borrowMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardBorrowSimul(_ account: Google_Protobuf_Any,
                                       _ toBorrow: Kava_Hard_V1beta1_MsgBorrow,
                                       _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let borrowMsg = genKavaHardBorrowMsg(toBorrow)
        return getSimulateTxA(account, borrowMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardBorrowMsg(_ toBorrow: Kava_Hard_V1beta1_MsgBorrow) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.hard.v1beta1.MsgBorrow"
            $0.value = try! toBorrow.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Hard Repay
    static func genKavaHardRepayTx(_ account: Google_Protobuf_Any,
                                   _ toRepay: Kava_Hard_V1beta1_MsgRepay,
                                   _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let repayMsg = genKavaHardRepayMsg(toRepay)
        return getSignedTxA(account, repayMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardRepaySimul(_ account: Google_Protobuf_Any,
                                      _ toRepay: Kava_Hard_V1beta1_MsgRepay,
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let repayMsg = genKavaHardRepayMsg(toRepay)
        return getSimulateTxA(account, repayMsg, fee, memo, baseChain)
    }
    
    static func genKavaHardRepayMsg(_ toRepay: Kava_Hard_V1beta1_MsgRepay) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.hard.v1beta1.MsgRepay"
            $0.value = try! toRepay.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Swap Deposit
    static func genKavaSwpDepositTx(_ account: Google_Protobuf_Any,
                                    _ toDeposit: Kava_Swap_V1beta1_MsgDeposit,
                                    _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let depositMsg = genKavaSwpDepositMsg(toDeposit)
        return getSignedTxA(account, depositMsg, fee, memo, baseChain)
    }
    
    static func geKavaSwpDepositSimul(_ account: Google_Protobuf_Any,
                                      _ toDeposit: Kava_Swap_V1beta1_MsgDeposit,
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let depositMsg = genKavaSwpDepositMsg(toDeposit)
        return getSimulateTxA(account, depositMsg, fee, memo, baseChain)
    }
    
    static func genKavaSwpDepositMsg(_ toDeposit: Kava_Swap_V1beta1_MsgDeposit) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.swap.v1beta1.MsgDeposit"
            $0.value = try! toDeposit.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Swap Withdraw
    static func genKavaSwpwithdrawTx(_ account: Google_Protobuf_Any,
                                     _ toWithdraw: Kava_Swap_V1beta1_MsgWithdraw,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let withdrawMsg = genKavaSwpWithdrawMsg(toWithdraw)
        return getSignedTxA(account, withdrawMsg, fee, memo, baseChain)
    }
    
    static func geKavaSwpWithdrawSimul(_ account: Google_Protobuf_Any,
                                       _ toWithdraw: Kava_Swap_V1beta1_MsgWithdraw,
                                       _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let withdrawMsg = genKavaSwpWithdrawMsg(toWithdraw)
        return getSimulateTxA(account, withdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaSwpWithdrawMsg(_ toWithdraw: Kava_Swap_V1beta1_MsgWithdraw) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.swap.v1beta1.MsgWithdraw"
            $0.value = try! toWithdraw.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Incentive All
    static func genKavaClaimIncentivesTx(_ account: Google_Protobuf_Any,
                                         _ incentives: Kava_Incentive_V1beta1_QueryRewardsResponse,
                                         _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let kavaIncentiveMsgs = genKavaIncentiveMsgs(account, incentives)
        return getSignedTxA(account, kavaIncentiveMsgs, fee, memo, baseChain)
    }
    
    static func genKavaClaimIncentivesSimul(_ account: Google_Protobuf_Any,
                                            _ incentives: Kava_Incentive_V1beta1_QueryRewardsResponse,
                                            _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let kavaIncentiveMsgs = genKavaIncentiveMsgs(account, incentives)
        return getSimulateTxA(account, kavaIncentiveMsgs, fee, memo, baseChain)
    }
        
    
    static func genKavaIncentiveMsgs(_ account: Google_Protobuf_Any, _ incentives: Kava_Incentive_V1beta1_QueryRewardsResponse) -> [Google_Protobuf_Any] {
        var msgs = [Google_Protobuf_Any]()
        if (incentives.hasUsdxMinting()) {
            let incentiveMint = Kava_Incentive_V1beta1_MsgClaimUSDXMintingReward.with {
                $0.sender = account.accountInfos().0!
                $0.multiplierName = "large"
            }
            let msg = Google_Protobuf_Any.with {
                $0.typeURL = "/kava.incentive.v1beta1.MsgClaimUSDXMintingReward"
                $0.value = try! incentiveMint.serializedData()
            }
            msgs.append(msg)
        }
        if (incentives.getHardRewardDenoms().count > 0) {
            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
            for denom in incentives.getHardRewardDenoms() {
                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = "large" })
            }
            let incentiveHard = Kava_Incentive_V1beta1_MsgClaimHardReward.with {
                $0.sender = account.accountInfos().0!
                $0.denomsToClaim = denoms_to_claims
            }
            let msg = Google_Protobuf_Any.with {
                $0.typeURL = "/kava.incentive.v1beta1.MsgClaimHardReward"
                $0.value = try! incentiveHard.serializedData()
            }
            msgs.append(msg)
        }
        if (incentives.getDelegatorRewardDenoms().count > 0) {
            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
            for denom in incentives.getDelegatorRewardDenoms() {
                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = "large" })
            }
            let incentiveDelegator = Kava_Incentive_V1beta1_MsgClaimDelegatorReward.with {
                $0.sender = account.accountInfos().0!
                $0.denomsToClaim = denoms_to_claims
            }
            let msg = Google_Protobuf_Any.with {
                $0.typeURL = "/kava.incentive.v1beta1.MsgClaimDelegatorReward"
                $0.value = try! incentiveDelegator.serializedData()
            }
            msgs.append(msg)
        }
        if (incentives.getSwapRewardDenoms().count > 0) {
            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
            for denom in incentives.getSwapRewardDenoms() {
                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = "large" })
            }
            let incentiveSwap = Kava_Incentive_V1beta1_MsgClaimSwapReward.with {
                $0.sender = account.accountInfos().0!
                $0.denomsToClaim = denoms_to_claims
            }
            let msg = Google_Protobuf_Any.with {
                $0.typeURL = "/kava.incentive.v1beta1.MsgClaimSwapReward"
                $0.value = try! incentiveSwap.serializedData()
            }
            msgs.append(msg)
        }
        if (incentives.getEarnRewardDenoms().count > 0) {
            var denoms_to_claims = Array<Kava_Incentive_V1beta1_Selection>()
            for denom in incentives.getEarnRewardDenoms() {
                denoms_to_claims.append(Kava_Incentive_V1beta1_Selection.with { $0.denom = denom; $0.multiplierName = "large" })
            }
            let incentiveEarn = Kava_Incentive_V1beta1_MsgClaimEarnReward.with {
                $0.sender = account.accountInfos().0!
                $0.denomsToClaim = denoms_to_claims
            }
            let msg = Google_Protobuf_Any.with {
                $0.typeURL = "/kava.incentive.v1beta1.MsgClaimEarnReward"
                $0.value = try! incentiveEarn.serializedData()
            }
            msgs.append(msg)
        }
        return msgs
    }
    
    //Tx for Kava Earn Deposit
    static func genKavaEarnDepositTx(_ account: Google_Protobuf_Any,
                                     _ earnDeposit: Kava_Router_V1beta1_MsgDelegateMintDeposit,
                                     _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let earnDepositMsg = genKavaEarnDepositMsg(earnDeposit)
        return getSignedTxA(account, earnDepositMsg, fee, memo, baseChain)
    }
    
    static func genKavaEarnDepositSimul(_ account: Google_Protobuf_Any,
                                        _ earnDeposit: Kava_Router_V1beta1_MsgDelegateMintDeposit,
                                        _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let earnDepositMsg = genKavaEarnDepositMsg(earnDeposit)
        return getSimulateTxA(account, earnDepositMsg, fee, memo, baseChain)
    }
    
    static func genKavaEarnDepositMsg(_ earnDeposit: Kava_Router_V1beta1_MsgDelegateMintDeposit) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.router.v1beta1.MsgDelegateMintDeposit"
            $0.value = try! earnDeposit.serializedData()
        }
        return [anyMsg]
    }
    
    //Tx for Kava Earn Withdraw
    static func genKavaEarnWithdrawTx(_ account: Google_Protobuf_Any,
                                      _ earnWithdraw: Kava_Router_V1beta1_MsgWithdrawBurn,
                                      _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let earnWithdrawMsg = genKavaEarnWithdrawMsg(earnWithdraw)
        return getSignedTxA(account, earnWithdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaEarnWithdrawSimul(_ account: Google_Protobuf_Any,
                                         _ earnWithdraw: Kava_Router_V1beta1_MsgWithdrawBurn,
                                         _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let earnWithdrawMsg = genKavaEarnWithdrawMsg(earnWithdraw)
        return getSimulateTxA(account, earnWithdrawMsg, fee, memo, baseChain)
    }
    
    static func genKavaEarnWithdrawMsg(_ earnWithdraw: Kava_Router_V1beta1_MsgWithdrawBurn) -> [Google_Protobuf_Any] {
        let anyMsg = Google_Protobuf_Any.with {
            $0.typeURL = "/kava.router.v1beta1.MsgWithdrawBurn"
            $0.value = try! earnWithdraw.serializedData()
        }
        return [anyMsg]
    }
    

//    
//    //AUTHz
//    //Tx for Authz Claim Rewards
//    static func genAuthzClaimReward(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzClaimRewards = genAuthzClaimStakingRewardMsg(grantee, granter, rewards)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzClaimRewards, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzClaimReward(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzClaimRewards = genAuthzClaimStakingRewardMsg(grantee, granter, rewards)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzClaimRewards, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzClaimStakingRewardMsg(_ grantee: String, _ granter: String, _ rewards: Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>) -> [Google_Protobuf_Any] {
//        var innerMsgs = Array<Google_Protobuf_Any>()
//        rewards.forEach { reward in
//            let claimMsg = Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.with {
//                $0.delegatorAddress = granter
//                $0.validatorAddress = reward.validatorAddress
//            }
//            let innerMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
//                $0.value = try! claimMsg.serializedData()
//            }
//            innerMsgs.append(innerMsg)
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = innerMsgs
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//
//    //Tx for Authz Claim Commission
//    static func genAuthzClaimCommission(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ grantee: String, _ granter: String, _ validatorAddress: String,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzClaimCommission = genAuthzClaimCommissionMsg(grantee, granter, validatorAddress)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzClaimCommission, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzClaimCommission(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                                _ grantee: String, _ granter: String, _ validatorAddress: String,
//                                                _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzClaimCommission = genAuthzClaimCommissionMsg(grantee, granter, validatorAddress)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzClaimCommission, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzClaimCommissionMsg(_ grantee: String, _ granter: String, _ validatorAddress: String) -> [Google_Protobuf_Any] {
//        let claimCommissionMsg = Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission.with {
//            $0.validatorAddress = validatorAddress
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission"
//            $0.value = try! claimCommissionMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Vote
//    static func genAuthzVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                             _ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>,
//                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzVote = genAuthzVoteMsg(grantee, granter, proposals)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzVote, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzVote = genAuthzVoteMsg(grantee, granter, proposals)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzVote, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzVoteMsg(_ grantee: String, _ granter: String, _ proposals: Array<MintscanProposalDetail>) -> [Google_Protobuf_Any] {
//        var innerMsgs = Array<Google_Protobuf_Any>()
//        proposals.forEach { proposal in
//            let voteMsg = Cosmos_Gov_V1beta1_MsgVote.with {
//                $0.voter = granter
//                $0.proposalID = UInt64(proposal.id!)!
//                if (proposal.getMyVote() == "Yes") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.yes
//                } else if (proposal.getMyVote() == "No") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.no
//                } else if (proposal.getMyVote() == "NoWithVeto") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.noWithVeto
//                } else if (proposal.getMyVote() == "Abstain") {
//                    $0.option = Cosmos_Gov_V1beta1_VoteOption.abstain
//                }
//            }
//            let innerMsg = Google_Protobuf_Any.with {
//                $0.typeURL = "/cosmos.gov.v1beta1.MsgVote"
//                $0.value = try! voteMsg.serializedData()
//            }
//            innerMsgs.append(innerMsg)
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = innerMsgs
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Delegate
//    static func genAuthzDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                 _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzDelegate = genAuthzDelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzDelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzDelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzDelegate = genAuthzDelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzDelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzDelegateMsg(_ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgDelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgDelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz UnDelegate
//    static func genAuthzUndelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzUndelegate = genAuthzUndelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzUndelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzUndelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzUndelegate = genAuthzUndelegateMsg(grantee, granter, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzUndelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzUndelegateMsg(_ grantee: String, _ granter: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgUndelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgUndelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz ReDelegate
//    static func genAuthzRedelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzRedelegate = genAuthzRedelegateMsg(grantee, granter, fromValAddress, toValAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzRedelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzRedelegate(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                           _ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin,
//                                           _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzRedelegate = genAuthzRedelegateMsg(grantee, granter, fromValAddress, toValAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzRedelegate, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzRedelegateMsg(_ grantee: String, _ granter: String, _ fromValAddress: String, _ toValAddress: String, _ amount: Coin) -> [Google_Protobuf_Any] {
//        let toCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount.denom
//            $0.amount = amount.amount
//        }
//        let delegateMsg = Cosmos_Staking_V1beta1_MsgBeginRedelegate.with {
//            $0.delegatorAddress = granter
//            $0.validatorSrcAddress = fromValAddress
//            $0.validatorDstAddress = toValAddress
//            $0.amount = toCoin
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.staking.v1beta1.MsgBeginRedelegate"
//            $0.value = try! delegateMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Authz Send
//    static func genAuthzSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                             _ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>,
//                             _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let authzSend = genAuthzSendMsg(grantee, granter, toAddress, amount)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, authzSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateAuthzSend(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let authzSend = genAuthzSendMsg(grantee, granter, toAddress, amount)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, authzSend, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genAuthzSendMsg(_ grantee: String, _ granter: String, _ toAddress: String, _ amount: Array<Coin>) -> [Google_Protobuf_Any] {
//        let sendCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let sendMsg = Cosmos_Bank_V1beta1_MsgSend.with {
//            $0.fromAddress = granter
//            $0.toAddress = toAddress
//            $0.amount = [sendCoin]
//        }
//        let innerMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.bank.v1beta1.MsgSend"
//            $0.value = try! sendMsg.serializedData()
//        }
//        let authzExec = Cosmos_Authz_V1beta1_MsgExec.with {
//            $0.grantee = grantee
//            $0.msgs = [innerMsg]
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmos.authz.v1beta1.MsgExec"
//            $0.value = try! authzExec.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //Tx for Liquidity Staking
//    static func genLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ creater: String, _ amount: String, _ hostDenom: String,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let staking = genLiquidityStaking(creater, amount, hostDenom)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ creater: String, _ amount: String, _ hostDenom: String,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let staking = genLiquidityStaking(creater, amount, hostDenom)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genLiquidityStaking(_ creater: String, _ amount: String, _ hostDenom: String) -> [Google_Protobuf_Any] {
//        let staking = Stride_Stakeibc_MsgLiquidStake.with {
//            $0.creator = creater
//            $0.amount = amount
//            $0.hostDenom = hostDenom
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/stride.stakeibc.MsgLiquidStake"
//            $0.value = try! staking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for Liquidity Unstaking
//    static func genLiquidityUnstaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ creater: String, _ amount: String, _ hostZone: String, _ receiver: String,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let unstaking = genLiquidityUnstaking(creater, amount, hostZone, receiver)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, unstaking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulateLiquidityUnstaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                              _ creater: String, _ amount: String, _ hostZone: String, _ receiver: String,
//                                              _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let unstaking = genLiquidityUnstaking(creater, amount, hostZone, receiver)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, unstaking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genLiquidityUnstaking(_ creater: String, _ amount: String, _ hostZone: String, _ receiver: String) -> [Google_Protobuf_Any] {
//        let unStaking = Stride_Stakeibc_MsgRedeemStake.with {
//            $0.creator = creater
//            $0.amount = amount
//            $0.hostZone = hostZone
//            $0.receiver = receiver
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/stride.stakeibc.MsgRedeemStake"
//            $0.value = try! unStaking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    //Tx for persistence Liquidity Staking
//    static func genPersisLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ delegator_address: String, _ coin: Coin,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let staking = genPersisLiquidityStaking(delegator_address, coin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulatePersisLiquidityStaking(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ delegator_address: String, _ coin: Coin,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let staking = genPersisLiquidityStaking(delegator_address, coin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, staking, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genPersisLiquidityStaking(_ delegator_address: String, _ coin: Coin) -> [Google_Protobuf_Any] {
//        let amount = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = coin.denom
//            $0.amount = coin.amount
//        }
//        let staking = Pstake_Lscosmos_V1beta1_MsgLiquidStake.with {
//            $0.delegatorAddress = delegator_address
//            $0.amount = amount
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/pstake.lscosmos.v1beta1.MsgLiquidStake"
//            $0.value = try! staking.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    static func genPersisLiquidityRedeem(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ delegator_address: String, _ coin: Coin,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let redeem = genPersisLiquidityRedeem(delegator_address, coin)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, redeem, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genSimulatePersisLiquidityRedeem(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                            _ delegator_address: String, _ coin: Coin,
//                                            _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let redeem = genPersisLiquidityRedeem(delegator_address, coin)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, redeem, privateKey, publicKey, fee, memo)
//    }
//    
//    static func genPersisLiquidityRedeem(_ delegator_address: String, _ coin: Coin) -> [Google_Protobuf_Any] {
//        let amount = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = coin.denom
//            $0.amount = coin.amount
//        }
//        let reedem = Pstake_Lscosmos_V1beta1_MsgRedeem.with {
//            $0.delegatorAddress = delegator_address
//            $0.amount = amount
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/pstake.lscosmos.v1beta1.MsgRedeem"
//            $0.value = try! reedem.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    //Tx for Neutron
//    static func genVaultDepositTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ contractAddress: String, _ amount: Array<Coin>,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let depositCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let jsonMsg: JSON = ["bond" : JSON()]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!, [depositCoin])
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
    
//    static func genVaultDepositSimul(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                        _ contractAddress: String, _ amount: Array<Coin>,
//                                        _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let depositCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = amount[0].denom
//            $0.amount = amount[0].amount
//        }
//        let jsonMsg: JSON = ["bond" : JSON()]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!, [depositCoin])
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
    
    
//
//    
//    static func genNeutronVaultWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ contractAddress: String, _ amount: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["unbond" : ["amount" : amount[0].amount]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronVaultWithdraw(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                         _ contractAddress: String, _ amount: Array<Coin>,
//                                         _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["unbond" : ["amount" : amount[0].amount]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronSingleVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                    _ contractAddress: String,_ proposalId: Int64, _ opinion: String,
//                                    _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : opinion]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronSingleVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                      _ contractAddress: String,_ proposalId: Int64, _ opinion: String,
//                                      _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : opinion]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronMultiVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                   _ contractAddress: String,_ proposalId: Int64, _ opinion: Int,
//                                   _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : ["option_id" : proposalId]]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    static func simulNeutronMultiVote(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                     _ contractAddress: String,_ proposalId: Int64, _ opinion: Int,
//                                     _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        let jsonMsg: JSON = ["vote" : ["proposal_id" : proposalId, "vote" : ["option_id" : proposalId]]]
//        let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//        let contractMsg = genWasmMsg(auth, contractAddress, Data(base64Encoded: jsonMsgBase64)!)
//        return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//    }
//    
//    
//    static func genNeutronSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                               _ neutronSwapPool: NeutronSwapPool, _ neutronInputPair: NeutronSwapPoolPair, _ neutronOutputPair: NeutronSwapPoolPair, _ inputAmount: String, _ beliefPrice: String,
//                               _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        if (neutronInputPair.type == "cw20") {
//            let innerMsg: JSON = ["swap" : ["belief_price" : beliefPrice]]
//            let innerMsgBase64 = try! innerMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let jsonMsg: JSON = ["send" : ["amount" : inputAmount, "contract" : neutronSwapPool.contract_address!, "msg" : innerMsgBase64]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let contractMsg = genWasmMsg(auth, neutronInputPair.address!, Data(base64Encoded: jsonMsgBase64)!)
//            return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//            
//        } else {
//            let offer_asset: JSON = ["info" : WUtils.swapAssetInfo(neutronInputPair), "amount" : inputAmount]
//            let jsonMsg: JSON = ["swap" : ["offer_asset" : offer_asset, "belief_price" : beliefPrice]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let fundCoin = Cosmos_Base_V1beta1_Coin.with {
//                $0.denom = neutronInputPair.denom!
//                $0.amount = inputAmount
//            }
//            let contractMsg = genWasmMsg(auth, neutronSwapPool.contract_address!, Data(base64Encoded: jsonMsgBase64)!, [fundCoin])
//            return getGrpcSignedTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//        }
//    }
//    
//    static func simulNeutronSwap(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64,
//                                 _ neutronSwapPool: NeutronSwapPool, _ neutronInputPair: NeutronSwapPoolPair, _ neutronOutputPair: NeutronSwapPoolPair, _ inputAmount: String, _ beliefPrice: String,
//                                 _ fee: Fee, _ memo: String, _ privateKey: Data, _ publicKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_SimulateRequest {
//        if (neutronInputPair.type == "cw20") {
//            let innerMsg: JSON = ["swap" : ["belief_price" : beliefPrice]]
//            let innerMsgBase64 = try! innerMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let jsonMsg: JSON = ["send" : ["amount" : inputAmount, "contract" : neutronSwapPool.contract_address!, "msg" : innerMsgBase64]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let contractMsg = genWasmMsg(auth, neutronInputPair.address!, Data(base64Encoded: jsonMsgBase64)!)
//            return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//            
//        } else {
//            let offer_asset: JSON = ["info" : WUtils.swapAssetInfo(neutronInputPair), "amount" : inputAmount]
//            let jsonMsg: JSON = ["swap" : ["offer_asset" : offer_asset, "belief_price" : beliefPrice]]
//            let jsonMsgBase64 = try! jsonMsg.rawData(options: [.sortedKeys, .withoutEscapingSlashes]).base64EncodedString()
//            let fundCoin = Cosmos_Base_V1beta1_Coin.with {
//                $0.denom = neutronInputPair.denom!
//                $0.amount = inputAmount
//            }
//            let contractMsg = genWasmMsg(auth, neutronSwapPool.contract_address!, Data(base64Encoded: jsonMsgBase64)!, [fundCoin])
//            return getGrpcSimulateTx(auth, pubkeyType, chainType, contractMsg, privateKey, publicKey, fee, memo)
//        }
//    }
//    
//    
//    
//    
//    static func genWasmMsg(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ contractAddress: String, _ innerMsg: Data? = nil, _ innerFunds: [Cosmos_Base_V1beta1_Coin]? = nil) -> [Google_Protobuf_Any] {
//        let exeContract = Cosmwasm_Wasm_V1_MsgExecuteContract.with {
//            $0.sender = WUtils.onParseAuthGrpc(auth).0!
//            $0.contract = contractAddress
//            if let innerMsg = innerMsg {
//                $0.msg  = innerMsg
//            }
//            if let innerFunds = innerFunds {
//                $0.funds = innerFunds
//            }
//        }
//        let anyMsg = Google_Protobuf_Any.with {
//            $0.typeURL = "/cosmwasm.wasm.v1.MsgExecuteContract"
//            $0.value = try! exeContract.serializedData()
//        }
//        return [anyMsg]
//    }
//    
//    
//    
//    
//    static func getGrpcSignedTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ chainType: ChainType, _ msgAnys: Array<Google_Protobuf_Any>, _ privateKey: Data, _ publicKey: Data, _ fee: Fee, _ memo: String) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let txBody = getGrpcTxBody(msgAnys, memo)
//        let signerInfo = getGrpcSignerInfos(auth, pubkeyType, publicKey, chainType)
//        let authInfo = getGrpcAuthInfo(signerInfo, fee)
//        let rawTx = getGrpcRawTxs(auth, pubkeyType, txBody, authInfo, privateKey, chainType)
//        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
//            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
//            $0.txBytes = try! rawTx.serializedData()
//        }
//    }
//    
//    static func getGrpcSignedTx2(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ chainId: String, _ msgAnys: Array<Google_Protobuf_Any>, _ privateKey: Data, _ publicKey: Data, _ fee: Fee, _ memo: String) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
//        let txBody = getGrpcTxBody(msgAnys, memo)
//        let signerInfo = getGrpcSignerInfos(auth, pubkeyType, publicKey, nil)
//        let authInfo = getGrpcAuthInfo(signerInfo, fee)
//        let rawTx = getGrpcRawTxs2(auth, pubkeyType, txBody, authInfo, privateKey, chainId)
//        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
//            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
//            $0.txBytes = try! rawTx.serializedData()
//        }
//    }
    
    static func getSignedTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ msgAnys: [Google_Protobuf_Any],
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfos(auth, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let rawTx = getRawTxs(auth, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
            $0.txBytes = try! rawTx.serializedData()
        }
    }
    
    static func getSignedTxA(_ account: Google_Protobuf_Any, _ msgAnys: [Google_Protobuf_Any],
                             _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_BroadcastTxRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfosA(account, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let rawTx = getRawTxsA(account, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_BroadcastTxRequest.with {
            $0.mode = Cosmos_Tx_V1beta1_BroadcastMode.async
            $0.txBytes = try! rawTx.serializedData()
        }
    }
    
    static func getSimulateTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ msgAnys: [Google_Protobuf_Any],
                                _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfos(auth, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let simulateTx = getSimulTxs(auth, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_SimulateRequest.with {
            $0.tx = simulateTx
        }
    }
    
    static func getSimulateTxA(_ account: Google_Protobuf_Any, _ msgAnys: [Google_Protobuf_Any],
                               _ fee: Cosmos_Tx_V1beta1_Fee, _ memo: String, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SimulateRequest {
        let txBody = getTxBody(msgAnys, memo)
        let signerInfo = getSignerInfosA(account, baseChain)
        let authInfo = getAuthInfo(signerInfo, fee)
        let simulateTx = getSimulTxsA(account, txBody, authInfo, baseChain)
        return Cosmos_Tx_V1beta1_SimulateRequest.with {
            $0.tx = simulateTx
        }
    }
    
    static func getTxBody(_ msgAnys: [Google_Protobuf_Any], _ memo: String) -> Cosmos_Tx_V1beta1_TxBody {
        return Cosmos_Tx_V1beta1_TxBody.with {
            $0.memo = memo
            $0.messages = msgAnys
        }
    }
    
    static func getSignerInfos(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SignerInfo {
        let single = Cosmos_Tx_V1beta1_ModeInfo.Single.with {
            $0.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
        }
        let mode = Cosmos_Tx_V1beta1_ModeInfo.with {
            $0.single = single
        }

        var pubKey: Google_Protobuf_Any?
        if (baseChain.accountKeyType.pubkeyType == .BERA_Secp256k1) {
            let pub = Ethermint_Crypto_V1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/polaris.crypto.ethsecp256k1.v1.PubKey"
                $0.value = try! pub.serializedData()
            }
            
        } else if (baseChain.accountKeyType.pubkeyType == .INJECTIVE_Secp256k1) {
            let pub = Injective_Crypto_V1beta1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/injective.crypto.v1beta1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
            
        } else if (baseChain.accountKeyType.pubkeyType == .ETH_Keccak256) {
            let pub = Ethermint_Crypto_V1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/ethermint.crypto.v1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        } else {
            let pub = Cosmos_Crypto_Secp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.crypto.secp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        }
        
        return Cosmos_Tx_V1beta1_SignerInfo.with {
            $0.publicKey = pubKey!
            $0.modeInfo = mode
            $0.sequence = WUtils.onParseAuthGrpc(auth).2!
        }
    }
    
    static func getSignerInfosA(_ account: Google_Protobuf_Any, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_SignerInfo {
        let single = Cosmos_Tx_V1beta1_ModeInfo.Single.with {
            $0.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
        }
        let mode = Cosmos_Tx_V1beta1_ModeInfo.with {
            $0.single = single
        }

        var pubKey: Google_Protobuf_Any?
        if (baseChain.accountKeyType.pubkeyType == .BERA_Secp256k1) {
            let pub = Ethermint_Crypto_V1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/polaris.crypto.ethsecp256k1.v1.PubKey"
                $0.value = try! pub.serializedData()
            }
            
        } else if (baseChain.accountKeyType.pubkeyType == .INJECTIVE_Secp256k1) {
            let pub = Injective_Crypto_V1beta1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/injective.crypto.v1beta1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
            
        } else if (baseChain.accountKeyType.pubkeyType == .ETH_Keccak256) {
            let pub = Ethermint_Crypto_V1_Ethsecp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/ethermint.crypto.v1.ethsecp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        } else {
            let pub = Cosmos_Crypto_Secp256k1_PubKey.with {
                $0.key = baseChain.publicKey!
            }
            pubKey = Google_Protobuf_Any.with {
                $0.typeURL = "/cosmos.crypto.secp256k1.PubKey"
                $0.value = try! pub.serializedData()
            }
        }
        
        return Cosmos_Tx_V1beta1_SignerInfo.with {
            $0.publicKey = pubKey!
            $0.modeInfo = mode
            $0.sequence = account.accountInfos().2!
//            $0.sequence = WUtils.onParseAuthGrpc(auth).2!
        }
    }
    
    static func getAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo, _ fee: Cosmos_Tx_V1beta1_Fee) -> Cosmos_Tx_V1beta1_AuthInfo {
        return Cosmos_Tx_V1beta1_AuthInfo.with {
            $0.fee = fee
            $0.signerInfos = [signerInfo]
        }
    }
    
    static func getRawTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                          _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_TxRaw {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainIdCosmos!
            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_TxRaw.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.signatures = [sigbyte]
        }
    }
    
    static func getRawTxsA(_ account: Google_Protobuf_Any, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                          _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_TxRaw {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainIdCosmos!
            $0.accountNumber = account.accountInfos().1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_TxRaw.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.signatures = [sigbyte]
        }
    }
    
    static func getSimulTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                            _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_Tx {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainIdCosmos!
            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_Tx.with {
            $0.authInfo = authInfo
            $0.body = txBody
            $0.signatures = [sigbyte]
        }
    }
    
    static func getSimulTxsA(_ account: Google_Protobuf_Any, _ txBody: Cosmos_Tx_V1beta1_TxBody,
                            _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ baseChain: BaseChain) -> Cosmos_Tx_V1beta1_Tx {
        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
            $0.bodyBytes = try! txBody.serializedData()
            $0.authInfoBytes = try! authInfo.serializedData()
            $0.chainID = baseChain.chainIdCosmos!
            $0.accountNumber = account.accountInfos().1!
        }
        let sigbyte = getByteSingleSignatures(try! signDoc.serializedData(), baseChain)
        return Cosmos_Tx_V1beta1_Tx.with {
            $0.authInfo = authInfo
            $0.body = txBody
            $0.signatures = [sigbyte]
        }
    }
    
    static func getByteSingleSignatures(_ toSignByte: Data, _ baseChain: BaseChain) -> Data {
        var hash: Data?
        if (baseChain.accountKeyType.pubkeyType == .BERA_Secp256k1 ||
            baseChain.accountKeyType.pubkeyType == .INJECTIVE_Secp256k1 ||
            baseChain.accountKeyType.pubkeyType == .ETH_Keccak256) {
            hash = toSignByte.sha3(.keccak256)
            
        } else {
            hash = toSignByte.sha256()
        }
        return SECP256K1.compactsign(hash!, privateKey: baseChain.privateKey!)!
    }
    
//
//    static func getGrpcAuthInfo(_ signerInfo: Cosmos_Tx_V1beta1_SignerInfo, _ fee: Fee) -> Cosmos_Tx_V1beta1_AuthInfo{
//        let feeCoin = Cosmos_Base_V1beta1_Coin.with {
//            $0.denom = fee.amount[0].denom
//            $0.amount = fee.amount[0].amount
//        }
//        let txFee = Cosmos_Tx_V1beta1_Fee.with {
//            $0.amount = [feeCoin]
//            $0.gasLimit = UInt64(fee.gas)!
//        }
//        return Cosmos_Tx_V1beta1_AuthInfo.with {
//            $0.fee = txFee
//            $0.signerInfos = [signerInfo]
//        }
//    }
//    
//    
//    static func getGrpcRawTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_TxRaw {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = BaseData.instance.getChainId(chainType)
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), chainType)
//        return Cosmos_Tx_V1beta1_TxRaw.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcRawTxs2(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainId: String) -> Cosmos_Tx_V1beta1_TxRaw {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = chainId
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), nil)
//        return Cosmos_Tx_V1beta1_TxRaw.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcSimulTxs(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse, _ pubkeyType: Int64, _ txBody: Cosmos_Tx_V1beta1_TxBody, _ authInfo: Cosmos_Tx_V1beta1_AuthInfo, _ privateKey: Data, _ chainType: ChainType) -> Cosmos_Tx_V1beta1_Tx {
//        let signDoc = Cosmos_Tx_V1beta1_SignDoc.with {
//            $0.bodyBytes = try! txBody.serializedData()
//            $0.authInfoBytes = try! authInfo.serializedData()
//            $0.chainID = BaseData.instance.getChainId(chainType)
//            $0.accountNumber = WUtils.onParseAuthGrpc(auth).1!
//        }
//        let sigbyte = getGrpcByteSingleSignatures(pubkeyType, privateKey, try! signDoc.serializedData(), chainType)
//        return Cosmos_Tx_V1beta1_Tx.with {
//            $0.authInfo = authInfo
//            $0.body = txBody
//            $0.signatures = [sigbyte]
//        }
//    }
//    
//    static func getGrpcByteSingleSignatures(_ pubkeyType: Int64, _ privateKey: Data, _ toSignByte: Data, _ chainType: ChainType?) -> Data {
//        var hash: Data?
//        if (chainType == .INJECTIVE_MAIN || chainType == .EVMOS_MAIN || chainType == .CANTO_MAIN) {
//            hash = HDWalletKit.Crypto.sha3keccak256(data: toSignByte)
//        } else if (chainType == .XPLA_MAIN && pubkeyType == 1) {
//            hash = HDWalletKit.Crypto.sha3keccak256(data: toSignByte)
//        } else {
//            hash = toSignByte.sha256()
//        }
//        let signedData = try! ECDSA.compactsign(hash!, privateKey: privateKey)
//        return signedData
//    }
}

extension SECP256K1 {
    public static func compactsign(_ data: Data, privateKey: Data) -> Data? {
        let ctx = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN))!
        defer { secp256k1_context_destroy(ctx) }
        let signature = UnsafeMutablePointer<secp256k1_ecdsa_signature>.allocate(capacity: 1)
        defer { signature.deallocate() }
        let status = data.withUnsafeBytes { (ptr: UnsafePointer<UInt8>) in
            privateKey.withUnsafeBytes { secp256k1_ecdsa_sign(ctx, signature, ptr, $0, nil, nil) }
        }
        guard status == 1 else { return nil }
        let normalizedsig = UnsafeMutablePointer<secp256k1_ecdsa_signature>.allocate(capacity: 1)
        defer { normalizedsig.deallocate() }
        secp256k1_ecdsa_signature_normalize(ctx, normalizedsig, signature)
        let length: size_t = 64
        var compact = Data(count: length)
        guard compact.withUnsafeMutableBytes({ return secp256k1_ecdsa_signature_serialize_compact(ctx, $0, normalizedsig) }) == 1 else { return nil }
        compact.count = length
        return compact
    }
}
