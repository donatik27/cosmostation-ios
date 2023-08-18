//
//  BaseData.swift
//  Cosmostation
//
//  Created by yongjoo on 07/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import Foundation
import SQLite
import SwiftKeychainWrapper
import SwiftProtobuf
import KeychainAccess


final class BaseData: NSObject{
    
    static let instance = BaseData()
    
    var database: Connection!
    var copySalt: String?
    
    var prices = Array<Price>()
    var mintscanAssets: [MintscanAsset]?
    
    
    public override init() {
        super.init();
        if database == nil {
            self.initdb();
        }
    }
    
    func setAllValidatorSort(_ sort : Int64) {
        UserDefaults.standard.set(sort, forKey: KEY_ALL_VAL_SORT)
    }
    
    func getAllValidatorSort() -> Int64 {
        return Int64(UserDefaults.standard.integer(forKey: KEY_ALL_VAL_SORT))
    }
    
    func setMyValidatorSort(_ sort : Int64) {
        UserDefaults.standard.set(sort, forKey: KEY_MY_VAL_SORT)
    }
    
    func getMyValidatorSort() -> Int64 {
        return Int64(UserDefaults.standard.integer(forKey: KEY_MY_VAL_SORT))
    }
    
    func setLastTab(_ index : Int) {
        UserDefaults.standard.set(index, forKey: KEY_LAST_TAB)
    }
    
    func getLastTab() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_LAST_TAB)
    }
    
    func setNeedRefresh(_ refresh : Bool) {
        UserDefaults.standard.set(refresh, forKey: KEY_ACCOUNT_REFRESH_ALL)
    }
    
    func getNeedRefresh() -> Bool {
        return UserDefaults.standard.bool(forKey: KEY_ACCOUNT_REFRESH_ALL)
    }
    
    func setTheme(_ theme : Int) {
        UserDefaults.standard.set(theme, forKey: KEY_THEME)
    }
    
    func getTheme() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_THEME)
    }
    
    func getThemeType() -> UIUserInterfaceStyle {
        if (getTheme() == 1) {
            return UIUserInterfaceStyle.light
        } else if (getTheme() == 2) {
            return UIUserInterfaceStyle.dark
        } else {
            return UIUserInterfaceStyle.unspecified
        }
    }
    
    func getThemeString() -> String {
        if (getTheme() == 1) {
            return NSLocalizedString("theme_light", comment: "")
        } else if (getTheme() == 2) {
            return NSLocalizedString("theme_dark", comment: "")
        }
        return NSLocalizedString("theme_system", comment: "")
    }
    
    enum Language: Int, CustomStringConvertible {
        case System = 0
        case English = 1
        case Korean = 2
        case Japanese = 3
        
        var description: String {
            switch self {
            case .System: return Locale.current.languageCode ?? ""
            case .English: return "en"
            case .Korean: return "ko"
            case .Japanese: return "ja"
            }
        }
    }
    
    func setLanguage(_ language : Int) {
        UserDefaults.standard.set(language, forKey: KEY_LANGUAGE)
    }
    
    func getLanguage() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_LANGUAGE)
    }
    
    func getLanguageType() -> String {
        let lang = getLanguage()
        if(lang == 1) {
            return "English(United States)"
        } else if(lang == 2) {
            return "한국어(대한민국)"
        } else if(lang == 3) {
            return "日本語(日本)"
        }
        return NSLocalizedString("theme_system", comment: "")
    }
    
    
    
    func setPriceChaingColor(_ value : Int) {
        UserDefaults.standard.set(value, forKey: KEY_PRICE_CHANGE_COLOR)
    }
    
    func getPriceChaingColor() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_PRICE_CHANGE_COLOR)
    }
    
    func setUsingAppLock(_ using : Bool) {
        UserDefaults.standard.set(using, forKey: KEY_USING_APP_LOCK)
    }
    
    func getUsingAppLock() -> Bool {
        return UserDefaults.standard.bool(forKey: KEY_USING_APP_LOCK)
    }
    
    func setUsingBioAuth(_ using : Bool) {
        UserDefaults.standard.set(using, forKey: KEY_USING_BIO_AUTH)
    }
    
    func getUsingBioAuth() -> Bool {
        return UserDefaults.standard.bool(forKey: KEY_USING_BIO_AUTH)
    }
    
    func setAutoPass(_ mode : Int) {
        UserDefaults.standard.set(mode, forKey: KEY_AUTO_PASS)
    }
    
    func getAutoPass() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_AUTO_PASS)
    }
    
    func getAutoPassString() -> String {
        if (getAutoPass() == 1) {
            return NSLocalizedString("autopass_5min", comment: "")
        } else if (getAutoPass() == 2) {
            return NSLocalizedString("autopass_10min", comment: "")
        } else if (getAutoPass() == 3) {
            return NSLocalizedString("autopass_30min", comment: "")
        }
        return NSLocalizedString("autopass_none", comment: "")
    }
    
//    func setLastPassTime() {
//        let now = Date().millisecondsSince1970
//        UserDefaults.standard.set(String(now), forKey: KEY_LAST_PASS_TIME)
//    }
//
//    func getLastPassTime() -> Int64 {
//        let last = Int64(UserDefaults.standard.string(forKey: KEY_LAST_PASS_TIME) ?? "0")!
//        return last
//    }
//
//    func setLastPriceTime() {
//        let now = Date().millisecondsSince1970
//        UserDefaults.standard.set(String(now), forKey: KEY_LAST_PRICE_TIME)
//    }
//
//    func isAutoPass() -> Bool {
//        let now = Date().millisecondsSince1970
//        let min: Int64 = 60000
//        if (getAutoPass() == 1) {
//            let passTime = Int64(UserDefaults.standard.string(forKey: KEY_LAST_PASS_TIME) ?? "0")! + (min * 5)
//            return passTime > now ? true : false
//
//        } else if (getAutoPass() == 2) {
//            let passTime = Int64(UserDefaults.standard.string(forKey: KEY_LAST_PASS_TIME) ?? "0")! + (min * 10)
//            return passTime > now ? true : false
//
//        } else if (getAutoPass() == 3) {
//            let passTime = Int64(UserDefaults.standard.string(forKey: KEY_LAST_PASS_TIME) ?? "0")! + (min * 30)
//            return passTime > now ? true : false
//        }
//        return false
//    }
    
    func setUsingEnginerMode(_ using : Bool) {
        UserDefaults.standard.set(using, forKey: KEY_ENGINER_MODE)
    }
    
    func getUsingEnginerMode() -> Bool {
        return UserDefaults.standard.bool(forKey: KEY_ENGINER_MODE)
    }
    
    
    func setFCMToken(_ token : String) {
        UserDefaults.standard.set(token, forKey: KEY_FCM_TOKEN)
    }
    
    func getFCMToken() -> String {
        return UserDefaults.standard.string(forKey: KEY_FCM_TOKEN) ?? ""
    }
    
//    func setKavaWarn() {
//        let remindTime = Calendar.current.date(byAdding: .day, value: 3, to: Date())?.millisecondsSince1970
//        UserDefaults.standard.set(String(remindTime!), forKey: KEY_KAVA_TESTNET_WARN)
//    }
//
//    func getKavaWarn() ->Bool {
//        let reminTime = Int64(UserDefaults.standard.string(forKey: KEY_KAVA_TESTNET_WARN) ?? "0")
//        if (Date().millisecondsSince1970 > reminTime!) {
//            return true
//        }
//        return false
//    }
//
//    func setEventTime() {
//        let remindTime = Calendar.current.date(byAdding: .day, value: 1, to: Date())?.millisecondsSince1970
//        UserDefaults.standard.set(String(remindTime!), forKey: KEY_PRE_EVENT_HIDE)
//    }
//
//    func getEventTime() -> Bool {
//        let reminTime = Int64(UserDefaults.standard.string(forKey: KEY_PRE_EVENT_HIDE) ?? "0")
//        if (Date().millisecondsSince1970 > reminTime!) {
//            return true
//        }
//        return false
//    }
    
    func setCustomIcon(_ type: String) {
        UserDefaults.standard.set(type, forKey: KEY_CUSTOM_ICON)
    }
    
    func getCustomIcon() -> String {
        return UserDefaults.standard.string(forKey: KEY_PRE_EVENT_HIDE) ?? ICON_DEFAULT
    }
    
    func getUserHiddenChains() -> Array<String>? {
        return UserDefaults.standard.stringArray(forKey: KEY_USER_HIDEN_CHAINS) ?? []
    }
    
    public func hasPassword() -> Bool{
        if (KeychainWrapper.standard.hasValue(forKey: "password")) {
            return true;
        } else {
            return false;
        }
    }
    
    /// checks if app lock is active and exists a password. If both are met returns true, false otherwise
    func isRequiredUnlock() -> Bool {
        getUsingAppLock() && hasPassword()
    }
}


extension BaseData {
    
    func initdb() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            var fileUrl = documentDirectory.appendingPathComponent("cosmostation").appendingPathExtension("sqlite3")
            do {
                var resourceValues = URLResourceValues()
                resourceValues.isExcludedFromBackup = true
                try fileUrl.setResourceValues(resourceValues)
                
            } catch { print(error) }
            
            let database = try Connection(fileUrl.path)
            self.database = database
            
            //V2 version
            let accountTable = TABLE_BASEACCOUNT.create(ifNotExists: true) { table in
                table.column(BASEACCOUNT_ID, primaryKey: true)
                table.column(BASEACCOUNT_UUID)
                table.column(BASEACCOUNT_NAME)
                table.column(BASEACCOUNT_TYPE)
            }
            try self.database.run(accountTable)
            
        } catch { print(error) }
    }
    
    //V2 version
    public func selectAccounts() -> Array<BaseAccount> {
        var result = Array<BaseAccount>()
        for row in try! database.prepare(TABLE_BASEACCOUNT) {
            result.append(BaseAccount(row[BASEACCOUNT_ID], row[BASEACCOUNT_UUID], row[BASEACCOUNT_NAME], row[BASEACCOUNT_TYPE]))
        }
        return result
    }
    
    
    
    public func selectAccount(_ id: Int64) -> BaseAccount? {
        return selectAccounts().filter { $0.id == id }.first
    }
    
    @discardableResult
    public func insertAccount(_ account: BaseAccount) -> Int64 {
        let toInsert = TABLE_BASEACCOUNT.insert(BASEACCOUNT_UUID <- account.uuid,
                                                BASEACCOUNT_NAME <- account.name,
                                                BASEACCOUNT_TYPE <- account.type.rawValue)
        return try! database.run(toInsert)
    }
    
    
    
    //legacy
    public func legacySelectAllMnemonics() -> Array<MWords> {
        var result = Array<MWords>()
        do {
            for mnemonicBD in try database.prepare(DB_MNEMONIC) {
                let mWords = MWords(mnemonicBD[DB_MNEMONIC_ID], mnemonicBD[DB_MNEMONIC_UUID], mnemonicBD[DB_MNEMONIC_NICKNAME],
                                    mnemonicBD[DB_MNEMONIC_CNT], mnemonicBD[DB_MNEMONIC_FAVO], mnemonicBD[DB_MNEMONIC_IMPORT_TIME]);
                result.append(mWords);
            }
        } catch { print(error) }
        return result
    }
    
    public func legacySelectAllAccounts() -> Array<Account> {
        var result = Array<Account>()
        do {
            for accountBD in try database.prepare(DB_ACCOUNT) {
                let account = Account(accountBD[DB_ACCOUNT_ID], accountBD[DB_ACCOUNT_UUID], accountBD[DB_ACCOUNT_NICKNAME], accountBD[DB_ACCOUNT_FAVO], accountBD[DB_ACCOUNT_ADDRESS],
                                      accountBD[DB_ACCOUNT_BASECHAIN], accountBD[DB_ACCOUNT_HAS_PRIVATE],  accountBD[DB_ACCOUNT_RESOURCE], accountBD[DB_ACCOUNT_FROM_MNEMONIC],
                                      accountBD[DB_ACCOUNT_PATH], accountBD[DB_ACCOUNT_IS_VALIDATOR], accountBD[DB_ACCOUNT_SEQUENCE_NUMBER], accountBD[DB_ACCOUNT_ACCOUNT_NUMBER],
                                      accountBD[DB_ACCOUNT_FETCH_TIME], accountBD[DB_ACCOUNT_M_SIZE], accountBD[DB_ACCOUNT_IMPORT_TIME], accountBD[DB_ACCOUNT_LAST_TOTAL],
                                      accountBD[DB_ACCOUNT_SORT_ORDER], accountBD[DB_ACCOUNT_PUSHALARM], accountBD[DB_ACCOUNT_NEW_BIP], accountBD[DB_ACCOUNT_CUSTOM_PATH],
                                      accountBD[DB_ACCOUNT_MNEMONIC_ID]);
                result.append(account);
            }
        } catch {
            print(error)
        }
        return result;
    }
    
    public func legacySelectAccountsByPrivateKey() -> Array<Account> {
        var result = Array<Account>()
        for account in legacySelectAllAccounts() {
            if (account.account_from_mnemonic == false && account.account_has_private == true) {
                result.append(account)
            }
        }
        return result
    }
    
    public func getKeyChain() -> Keychain{
        return Keychain(service: "io.cosmostation")
            .synchronizable(false)
            .accessibility(.afterFirstUnlockThisDeviceOnly)
    }
}


extension BaseData {
    func setDBVersion(_ version: Int) {
        UserDefaults.standard.set(version, forKey: KEY_DB_VERSION)
    }
    
    func getDBVersion() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_DB_VERSION)
    }
    
    func setLastAccount(_ account: BaseAccount) {
        UserDefaults.standard.set(account.id, forKey: KEY_LAST_ACCOUNT)
    }
    
    func getLastAccount() -> BaseAccount? {
        let id = UserDefaults.standard.integer(forKey: KEY_LAST_ACCOUNT)
        if let account = selectAccount(Int64(id)) {
            return account
        }
        return selectAccounts().first
    }
    
    
    //Userdefault for Asset prices
    func setLastPriceTime() {
        let now = Date().millisecondsSince1970
        UserDefaults.standard.set(String(now), forKey: KEY_LAST_PRICE_TIME)
    }
    
    func needPriceUpdate() -> Bool {
        if (BaseData.instance.prices.count <= 0) { return true }
        let now = Date().millisecondsSince1970
        let min: Int64 = 60000
        let last = Int64(UserDefaults.standard.string(forKey: KEY_LAST_PRICE_TIME) ?? "0")! + (min * 2)
        return last < now ? true : false
    }
    
    func setCurrency(_ currency : Int) {
        UserDefaults.standard.set(currency, forKey: KEY_CURRENCY)
    }
    
    func getCurrency() -> Int {
        return UserDefaults.standard.integer(forKey: KEY_CURRENCY)
    }
    
    func getCurrencyString() -> String {
        if (getCurrency() == 0) {
            return NSLocalizedString("currency_usd", comment: "")
        } else if (getCurrency() == 1) {
            return NSLocalizedString("currency_eur", comment: "")
        } else if (getCurrency() == 2) {
            return NSLocalizedString("currency_krw", comment: "")
        } else if (getCurrency() == 3) {
            return NSLocalizedString("currency_jpy", comment: "")
        } else if (getCurrency() == 4) {
            return NSLocalizedString("currency_cny", comment: "")
        } else if (getCurrency() == 5) {
            return NSLocalizedString("currency_rub", comment: "")
        } else if (getCurrency() == 6) {
            return NSLocalizedString("currency_gbp", comment: "")
        } else if (getCurrency() == 7) {
            return NSLocalizedString("currency_inr", comment: "")
        } else if (getCurrency() == 8) {
            return NSLocalizedString("currency_brl", comment: "")
        } else if (getCurrency() == 9) {
            return NSLocalizedString("currency_idr", comment: "")
        } else if (getCurrency() == 10) {
            return NSLocalizedString("currency_dkk", comment: "")
        } else if (getCurrency() == 11) {
            return NSLocalizedString("currency_nok", comment: "")
        } else if (getCurrency() == 12) {
            return NSLocalizedString("currency_sek", comment: "")
        } else if (getCurrency() == 13) {
            return NSLocalizedString("currency_chf", comment: "")
        } else if (getCurrency() == 14) {
            return NSLocalizedString("currency_aud", comment: "")
        } else if (getCurrency() == 15) {
            return NSLocalizedString("currency_cad", comment: "")
        } else if (getCurrency() == 16) {
            return NSLocalizedString("currency_myr", comment: "")
        }
        return ""
    }
    
    func getCurrencySymbol() -> String {
        if (getCurrency() == 0) {
            return NSLocalizedString("currency_usd_symbol", comment: "")
        } else if (getCurrency() == 1) {
            return NSLocalizedString("currency_eur_symbol", comment: "")
        } else if (getCurrency() == 2) {
            return NSLocalizedString("currency_krw_symbol", comment: "")
        } else if (getCurrency() == 3) {
            return NSLocalizedString("currency_jpy_symbol", comment: "")
        } else if (getCurrency() == 4) {
            return NSLocalizedString("currency_cny_symbol", comment: "")
        } else if (getCurrency() == 5) {
            return NSLocalizedString("currency_rub_symbol", comment: "")
        } else if (getCurrency() == 6) {
            return NSLocalizedString("currency_gbp_symbol", comment: "")
        } else if (getCurrency() == 7) {
            return NSLocalizedString("currency_inr_symbol", comment: "")
        } else if (getCurrency() == 8) {
            return NSLocalizedString("currency_brl_symbol", comment: "")
        } else if (getCurrency() == 9) {
            return NSLocalizedString("currency_idr_symbol", comment: "")
        } else if (getCurrency() == 10) {
            return NSLocalizedString("currency_dkk_symbol", comment: "")
        } else if (getCurrency() == 11) {
            return NSLocalizedString("currency_nok_symbol", comment: "")
        } else if (getCurrency() == 12) {
            return NSLocalizedString("currency_sek_symbol", comment: "")
        } else if (getCurrency() == 13) {
            return NSLocalizedString("currency_chf_symbol", comment: "")
        } else if (getCurrency() == 14) {
            return NSLocalizedString("currency_aud_symbol", comment: "")
        } else if (getCurrency() == 15) {
            return NSLocalizedString("currency_cad_symbol", comment: "")
        } else if (getCurrency() == 16) {
            return NSLocalizedString("currency_myr_symbol", comment: "")
        }
        return ""
    }
}
