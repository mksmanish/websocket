//
//  Constants.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import UIKit

class Constants: NSObject {
    
    static let APP_DEL = UIApplication.shared.delegate as! AppDelegate
    
    public static let kIS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    public static let kToken = "2edae3c072da41c48e575b1a52e1c90f:5451f17bcb1cb6eaca0cd65a9be7d87668fe0982a002f45af0f01e6d3db4ebe4a6d5eaf86c8f0873757a8627ea275b5e5e50fd4819eed66ba628ccfaf96a980084a276c8af22f124e8c2456f2d5ec4b3e99da3e57c5f1607acfaf5db0cf9337153cd2dd2ee32c9543675c0a94cb390f25351438b84edb27ba5f06a892f9b21c24e8d251e65b1750c63a25fd654b13443dcfd26029c6ee6c25df6c98965c8cf24c599c8dd5b495754c4b91f1290c455819d7a62de5e0af38da0117eecd0f3dc3670b802fc5894219a39bdb3dfa1627529ddbd48afda384924db7275aa609d1345"
    //loginviewCOntroller
    public static let enjoyYourLife = "Enjoy your Life"
    public static let letYourWealthText = "Let your wealth do the work for you."
    public static let TryNow = "Try Now"
    public static let WelcomeToInvestNow = "Welcome To Invest Now"
    public static let LoginToYourAccount = "Login To Your Account"
    public static let Email = "Email"
    public static let Password = "Password"
    public static let Login = "Login"
    public static let copyRight = "Copyright @ 2022 Bambu. All right reserved."
    public static let NoRecordsFound = "No records Found"
    
    //marketwatchViewController
    public static let logout = "Logout"
    public static let SymbolSubscription = "Symbol Subscription"
    public static let SymbolSubscriptionMsg = "Are you sure ,wants to remove from favourites?"
    public static let logoutMsg = "Are you sure ,wants to logout?"
    public static let Confirm = "Confirm"
    public static let Cancel = "Cancel"
    public static let Sell = "Sell"
    public static let Buy = "Buy"
    
    //pageViewController
    public static let Personalized_investment_portfolio = "Personalized investment portfolio"
    public static let Personalised_text = "We select the right portfolio to fit your profile and align with your goals."
    public static let Seamless_payment_to_fund_your_investments = "Seamless payment to fund your investments"
    public static let Seamless_text = "Link your bank account and fund your investments - simply and seamlessly."
    public static let Smart_recommendations_to_get_it_right = "Smart recommendations to get it right"
    public static let Smart_text =  "Grow your money effectively with smart recommendations to help you reach your goal."
    public static let Track_movements_anytime_anywhere = "Track movements anytime,anywhere"
    public static let Track_text = "Your portfolio performance is readily available so you can track it on the go."
    public static let Next = "Next"
    

}

class CellIdentifiers: NSObject {
    
    public static let marketWatchCell = "marketWatchCell"
    
    
}


extension Notification.Name {
}

struct K {
    struct ProductionServer {
        static let baseURL = "https://gorest.co.in" // vm server
        static let localURL = "https://api-dev-scus-demo.azurewebsites.net"
    }
    
    //    API Related Keys
    struct LoginAPIParameterKey {
        static let account_tc_id = "account_tc_id"
        
    }
    
}
enum HTTPHeaderField: String {
    case authentication = "auth"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case Authorization = "Authorization"
}

enum ContentType: String {
    case json = "application/json"
}



