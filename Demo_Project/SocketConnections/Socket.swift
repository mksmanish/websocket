//
//  Socket.swift
//  Demo_Project
//
//  Created by Tradesocio on 28/04/22.
//

import Foundation
import SwiftWebSocket

class Socketservice{
    
    var socketservice = String()
    var ws = WebSocket()
    private static var privateShared : Socketservice?
    class func shared() -> Socketservice { // change class to final to prevent override
        guard let uwShared = privateShared else {
            privateShared = Socketservice()
            return privateShared!
        }
        return uwShared
    }
    class func destroy() {
        privateShared = nil
    }
    
    func SocketDataAPI(completion: @escaping(MarketWatchModel?, String)->()){
        
        var socketGC1Model : MarketWatchModel?
        
        ws = WebSocket("wss://win-ntcloud.tradesocio.com:1611/13164_1651140161_iOS") //socket url
        
        let send : ()->() = {
            let msg = "{\n  \"RTAccountInfo\" : 1,\n  \"Version\" : 1.5,\n  \"Password\" : \"abc123\",\n  \"msgtype\" : 41,\n  \"UserName\" : \"13164\"\n}"
            self.ws.send(msg)
        }
        ws.event.open = {
            send()
        }
        ws.event.close = { code, reason, clean in
            
            NSLog("#####** socket gc1 closed \(reason)")
            completion(nil, self.ws.readyState.description)
        }
        ws.event.error = { error in
            
            NSLog("#####** socket gc1 closed")
        }
        ws.event.message = { message in
            var dataMsg: Data?
            let strMsg = message as? String
            
            dataMsg = strMsg?.data(using: String.Encoding.utf8)
            if dataMsg != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataMsg ?? Data(), options: [])
                    DispatchQueue.main.async {
                        
                        if let jsonDic = json as? Dictionary<String,Any>{
                            socketGC1Model = MarketWatchModel(jsonDic)
                            if socketGC1Model?.reason == "VALID"{
                                print(socketGC1Model?.userName ?? 0)
                                
                            }
                        }
                        completion( socketGC1Model!,self.ws.readyState.description)
                    }
                } catch {
                    DispatchQueue.main.async {
                        
                    }
                }
            }
        }
    }
    
}
