//
//  MarketWatchModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 28/04/22.
//

import Foundation
import UIKit

class MarketWatchModel {
    let accountId: Int?
    let userName: String?
    let reason: String?
    let status: Int?
    let connID: Int?
    let msgtype: Int?
    let isLast: Int?
    let noOfSymbols: Int?
    var quotesStream: [QuotesStream]?
    init(_ dict: Dictionary<String,Any>) {
        self.accountId = dict.getIntValueForKey("AccountId")
        self.userName = dict.getStringValueForKey("UserName")
        self.reason = dict.getStringValueForKey("Reason")
        self.status = dict.getIntValueForKey("Status")
        self.connID = dict.getIntValueForKey("ConnID")
        self.msgtype = dict.getIntValueForKey("msgtype")
        self.isLast = dict.getIntValueForKey("isLast")
        self.noOfSymbols = dict.getIntValueForKey("NoOfSymbols")
        if let array = dict["QuotesStream"] as? [Dictionary<String,Any>]{
            self.quotesStream = array.map{QuotesStream($0)}
        }
    }
}

class QuotesStream {
    let depth: Int?
    var feedInDepth: [QuotesStreamDetails]?
    let symbol: String?
    let time: Int?
    
    init(_ dict: Dictionary<String,Any>) {
        self.depth = dict.getIntValueForKey("Depth")
        self.symbol = dict.getStringValueForKey("Symbol")
        self.time = dict.getIntValueForKey("Time")
        if let array = dict["FeedInDepth"] as? [Dictionary<String,Any>]{
            self.feedInDepth = array.map{QuotesStreamDetails($0)}
        }
    }
}

class QuotesStreamDetails {
    let askPrice: Double?
    let askQuantity: Int?
    let bidPrice: Double?
    let bidQuantity: Int?
    
    init(_ dict: Dictionary<String,Any>) {
        self.askPrice = dict.getDoubleValueForKey("AskPrice")
        self.askQuantity = dict.getIntValueForKey("AskQuantity")
        self.bidPrice = dict.getDoubleValueForKey("BidPrice")
        self.bidQuantity = dict.getIntValueForKey("BidQuantity")
    }
}
