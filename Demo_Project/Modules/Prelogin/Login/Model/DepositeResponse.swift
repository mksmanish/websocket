//
//  LoginUser.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import SkyFloatingLabelTextField
// MARK: - loginUserr


struct DepositeResponse: Decodable{
    let success: Bool?
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass
struct DataClass:Decodable {
   
    let accountBalance, convertedBalance, introducerID: Int?
    let isChargePercent: Bool?
    let min, max, convertedMin, convertedMax: Int?
    let chargeApplied, accountID: Int?
    let accountCurrency: String?
 
}

struct DepositeRequest: Encodable{
    let accountTcId : Int
    
    enum CodingKeys: String, CodingKey {
        case accountTcId = "account_tc_id"
        
    }
    
}


