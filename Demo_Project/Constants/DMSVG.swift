//
//  DMSVG.swift
//  Demo_Project
//
//  Created by Tradesocio on 08/04/22.
//

import Foundation
import UIKit

/// class containing SVG names
class DMSVG: NSObject {
    //MARK: - shared variable
    static let shared = DMSVG()
    
    //MARK:- Pre login
    let main_logo = "main_logo"
    let logo = "logo"
    let pine = "pine"
    
    
}

extension String {
    /// This method is used for setting the svg icons according to customer type
    ///
    /// - Parameter iconName: as string
    /// - Returns: string from plist
    func getIcon() -> String {
        let path = Utility.shared.readPlist(plistName: "IconsNew")
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            if let icon = dic[self] as? String {
                return icon
            }
            else {
                return "info"
            }
        }
        return "info"
    }
}
