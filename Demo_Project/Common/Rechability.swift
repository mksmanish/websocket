//
//  Rechability.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/05/22.
//

import Foundation
import Network
import UIKit

class Reachable :BaseViewController{
 static let shared = Reachable()

 let monitorForWifi = NWPathMonitor(requiredInterfaceType: .wifi)
 let monitorForCellular = NWPathMonitor(requiredInterfaceType: .cellular)
 private var wifiStatus: NWPath.Status = .requiresConnection
 private var cellularStatus: NWPath.Status = .requiresConnection
 var isReachable: Bool { wifiStatus == .satisfied || isReachableOnCellular }
 var isReachableOnCellular: Bool { cellularStatus == .satisfied }

 func startMonitoring() {
     monitorForWifi.pathUpdateHandler = { [weak self] path in
         self?.wifiStatus = path.status

         if path.status == .satisfied {
          //   DLog.message("Wifi is connected!")
             // post connected notification
         } else {
           //  DLog.message("No wifi connection.")
             self?.showToast(message: "No wifi connection.", font: .systemFont(ofSize: 15.0))
             // post disconnected notification
         }
     }
     monitorForCellular.pathUpdateHandler = { [weak self] path in
         self?.cellularStatus = path.status

         if path.status == .satisfied {
         //    DLog.message("Cellular connection is connected!")
             // post connected notification
         } else {
           //  DLog.message("No cellular connection.")
             // post disconnected notification
             self?.showToast(message: "No wifi connection.", font: .systemFont(ofSize: 15.0))
         }
     }

     let queue = DispatchQueue(label: "NetworkMonitor")
     monitorForCellular.start(queue: queue)
     monitorForWifi.start(queue: queue)
 }

 func stopMonitoring() {
     monitorForWifi.cancel()
     monitorForCellular.cancel()
 }
 
 class func isConnectedToNetwork() -> Bool {
     return shared.isReachable
 }
}
