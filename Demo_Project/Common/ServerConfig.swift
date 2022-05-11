//
//  ServerConfig.swift
//  Demo_Project
//
//  Created by Tradesocio on 07/04/22.
//

import Foundation

enum BaseUrl: String {
    case local = "https://nxcloud.tradesocio.com"
    case QA = "https://gorest.co.in"
    case Prod = "https://prod.com"
    case UAT = "https://uat.com"
    case CUG = "https://cug.com"
}
class ServerConfig {
    static let shared:ServerConfig = ServerConfig()
    var baseURL:String?
    
    func serverSetupConfig() {
          #if local
         self.baseURL = BaseUrl.local.rawValue
         #elseif QA
         self.baseURL = BaseUrl.QA.rawValue
         #elseif Prod
         self.baseURL = BaseUrl.Prod.rawValue
         #elseif UAT
         self.baseURL = BaseUrl.UAT.rawValue
         #elseif CUG
         self.baseURL = BaseUrl.CUG.rawValue
        #endif
        
    }
}
