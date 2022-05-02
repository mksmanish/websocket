//
//  AccountResponse.swift
//  Demo_Project
//
//  Created by Tradesocio on 07/04/22.
//

import Foundation

// MARK: - AccountResponse
struct AccountResponse : Codable {
    let success: Bool?
    let message: String?
    let data: DataAccounts?
}

// DataClass.swift

import Foundation

// MARK: -  DataAccounts
struct DataAccounts : Codable {
    let defaultAccountDetails: DefaultAccountDetails?
    let defaultAccount: Int?
    let accounts: [DefaultAccountDetails]?
    
    enum CodingKeys: String,CodingKey{
        case defaultAccountDetails = "default_account_details"
        case defaultAccount = "default_account"
        case accounts = "accounts"
    }
}

// DefaultAccountDetails.swift

import Foundation

// MARK: - DefaultAccountDetails
struct DefaultAccountDetails : Codable {
    let accountID: Int?
    let accountInceptionDate, accountName, accountNumber: String?
    let accountRole, accountType, activeStatus: Int?
    let availableBalance: Double?
    let balance, brokerID: Int?
    let closePositionExists: Bool?
    let connID, customerGroupID: Int?
    let defaultSymbol: String?
    let equity: Int?
    let externalID: String?
    let freeMargin, introducerID: Int?
    let introducerName: String?
    let investorType: Int?
    let isGlobal: Bool?
    let lastMonth: String?
    let margin: Int?
    let maxDD: String?
    let maxDDPerc, netDeposit: Int?
    let openPositionExists: Bool?
    let pnl: Int?
    let participantLoginID: String?
    let participantPassword: String?
    let profileID, profit: Int?
    let returnPerc: Double?
    let riskPercentage: Int?
    let strategyDescription: String?
    let upnl: Int?
    let userName: String?
    let ytd: String?
    let isBBookMaster: Bool?
}
