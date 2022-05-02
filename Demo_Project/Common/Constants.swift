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
    public static let kToken = "625abcde740e71a06d87900b956a713c:94ae1dc975f1e070cc93daf974c6f2d6eb7ccb20c5019dbdbabf9865ba28c6c4c0c2618dea142c1c0636c07bc4b15b21f1e161a9f2003b7840daab68b69c0f9d2b4b3e594245390c4ea29358ceb31361a69cb57d92ed1ac8aaf22a72b4787e539cac757adffa8636e1d87e3bcecd79fa201ca5898e983ce61943816e8d1cc9df6225d58a6924199cd1d007f1a2ad878a1274f1d70637da4719bc7e2c8815dc7daa6b7de844214a982d6eebcf6bd1229cf1a35d5daff343eecb90f98c89e03d254e30e8b1ca6c171a13f970db855c2d08f04fdfabab8a14ccbfb8e3e0961fdf466c8191fc2778cfe60745ee673ee40092024d1c210972e1461e984877dcacb1cdb6f90cfcc77692be8b28f265af8c32a072d8c1ef5061c886b08f69f293471a0fa0d9c6f6b03e44d0d15ba22281aacfb5"
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



