//
//  FontManager.swift
//  Demo_Project
//
//  Created by Tradesocio on 05/04/22.
//

import Foundation
import UIKit

class FontManager{
    static let shared = FontManager()

    /*
     Method Name : convertHexColor
     This method returns color by converting from Hex color.
     */
    func convertHexColor(name: String) ->UIColor
    {
        //#THEMECODE : Read plist according to customer type
        let path = readPlist(plistName: "ColorCode")
        
        //If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
           
            let name = dic[name]! as! String
            
            return  UIColor(hex: name)
        }
        return UIColor()
    }
    
    /*
     Method Name : getSpecificFont
     This method returns font according to screen size.
     */
    
    func getSpecificFont(size:String, fontName:String) -> UIFont {
        
        let path = getPathAccToDevice()
        ////If your plist contain root as Dictionary
        if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
            
            let fontName = dic[fontName]! as! String
            let fontSize =  dic[size]! as! CGFloat
            
            return  UIFont(descriptor: UIFontDescriptor(name: fontName, size: fontSize), size: fontSize)
        }
        return UIFont()
    }
    
    /// Function to get the plist of specific device
    ///
    /// - Returns: path in string format
    func getPathAccToDevice()->String
    {
        var path = readPlist(plistName: "iPhone6")
        
        switch UIDevice().screenType{
        case .iPhone5:
            path = readPlist(plistName: "iPhone")
            
        case .iPhone6:
            path = readPlist(plistName: "iPhone6")
            
        case .iPhone6Plus:
            path = readPlist(plistName: "iPhonePlus")
            
        case .iPhone12:
            path = readPlist(plistName: "iPhone12")
        default: break
        }
        
        return path
    }
    
    /*
     Method Name : readPlist
    This method reads plist file according to font type.
     */

    func readPlist(plistName : String) -> String {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist"){
            return path
        }
       return ""

    }
    
    
}
