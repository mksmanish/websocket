//
//  Dictionary+Extension.swift
//  Demo_Project
//
//  Created by Tradesocio on 28/04/22.
//

import Foundation
import UIKit


extension Dictionary where Key == String{
    
    func getDictionaryForKey(_ key : String)-> Dictionary<String,Any>?{
        if let dictionary = self[key] as? Dictionary<String,Any>{
            return dictionary
        }
        return nil
    }
    func getMesssageForKey(_ key: String)-> String{
        //HARDCODE LABELS
        var message = "oops! Something went wrong."
        if let msg = self[key] as? String{
            message = msg
        }
        return message
    }
    func getIntValueForKey(_ key : String)->Int{
        var value = 0
        
        if self[key] is String{
            if let val = self[key] as? String{
                value = Int(val) ?? 0
                return value
            }
        }
        
        if let val = self[key] as? Int{
            value = val
        }
        return value
    }
    func getStringValueForKey(_ key : String)-> String{
        var value = ""
        if let val = self[key] as? String{
            value = val
        }else{
            if let val = self[key] as? Int{
                return String(val)
            }else{
                if let val = self[key] as? Double{
                    return String(val)
                }
            }
        }
        return value
    }
    func getColorValueForKey(_ key : String)-> UIColor{
        var value = UIColor.black
        if let val = self[key] as? UIColor{
            value = val
        }
        return value
    }
    func getBoolValueForKey(_ key : String)-> Bool{
        
        if self[key] is String{
            if let val = self[key] as? String{
                return Int(val) == 1 ? true : false
            }
        }else if self[key] is Int{
            if let val = self[key] as? Int{
                return val == 1 ? true : false
            }
        }else{
            
            if let value = self[key] as? Bool{
                return value
            }
        }
        return false
    }
    func getDoubleValueForKey( _ key : String)-> Double{
        var value = 0.0
        if let val = self[key] as? String{
            // value = val
            if let doubleValue = Double(val){
                value = doubleValue
            }
        }
        if let val = self[key] as? Double{
            value = val
        }
        return value
    }
    func getFloatValueForKey( _ key : String)-> Float{
        var value : Float = 0.0
        if let val = self[key] as? String{
            // value = val
            if let doubleValue = Float(val){
                value = doubleValue
            }
        }
        if let val = self[key] as? Float{
            value = val
        }
        return value
    }
    mutating func switchKey(fromKey: Key, toKey: Key) {
        if let entry = removeValue(forKey: fromKey) {
            self[toKey] = entry
        }
    }
    
    func getIntValueForKey(_ key1: String,_ key2: String)->Int{
        var value = 0
        if self[key1] != nil{
            if self[key1] is String{
                if let val = self[key1] as? String{
                    value = Int(val) ?? 0
                    return value
                }
            }
            
            if let val = self[key1] as? Int{
                value = val
            }
        }else{
            if self[key2] is String{
                if let val = self[key2] as? String{
                    value = Int(val) ?? 0
                    return value
                }
            }
            
            if let val = self[key2] as? Int{
                value = val
            }
        }
        return value
    }
    
    func getStringValueForKey(_ key1: String, _ key2: String)-> String{
        var value = ""
        if self[key1] != nil{
            if let val = self[key1] as? String{
                value = val
            }else{
                if let val = self[key1] as? Int{
                    return String(val)
                }else{
                    if let val = self[key1] as? Double{
                        return String(val)
                    }
                }
            }
        }else{
            if let val = self[key2] as? String{
                value = val
            }else{
                if let val = self[key2] as? Int{
                    return String(val)
                }else{
                    if let val = self[key2] as? Double{
                        return String(val)
                    }
                }
            }
        }
        
        return value
    }
    
    func getBoolValueForKey(_ key1: String, _ key2: String)-> Bool{
        
        if self[key1] != nil{
            if self[key1] is String{
                if let val = self[key1] as? String{
                    return Int(val) == 1 ? true : false
                }
            }else if self[key1] is Int{
                if let val = self[key1] as? Int{
                    return val == 1 ? true : false
                }
            }else{
                
                if let value = self[key1] as? Bool{
                    return value
                }
            }
        }else{
            if self[key2] is String{
                if let val = self[key2] as? String{
                    return Int(val) == 1 ? true : false
                }
            }else if self[key2] is Int{
                if let val = self[key2] as? Int{
                    return val == 1 ? true : false
                }
            }else{
                
                if let value = self[key2] as? Bool{
                    return value
                }
            }
        }
        
        return false
    }
    
    func getDoubleValueForKey( _ key1: String, _ key2: String)-> Double{
        var value = 0.0
        if self[key1] != nil{
            if let val = self[key1] as? String{
                // value = val
                if let doubleValue = Double(val){
                    value = doubleValue
                }
            }
            if let val = self[key1] as? Double{
                value = val
            }
        }else{
            if let val = self[key2] as? String{
                // value = val
                if let doubleValue = Double(val){
                    value = doubleValue
                }
            }
            if let val = self[key2] as? Double{
                value = val
            }
        }
        return value
    }
    
    func getFloatValueForKey( _ key1: String, _ key2: String)-> Float{
        var value : Float = 0.0
        if self[key1] != nil{
            if let val = self[key1] as? String{
                // value = val
                if let doubleValue = Float(val){
                    value = doubleValue
                }
            }
            if let val = self[key1] as? Float{
                value = val
            }
        }else{
            if let val = self[key2] as? String{
                // value = val
                if let doubleValue = Float(val){
                    value = doubleValue
                }
            }
            if let val = self[key2] as? Float{
                value = val
            }
        }
        return value
    }
}

extension UIColor{
    static func colorWithRGBA(_ rgba: UInt32) -> UIColor {
        let red = CGFloat(rgba >> 24) / 255
        let green = CGFloat((rgba & 0x00FF0000) >> 16) / 255
        let blue = CGFloat((rgba & 0x0000FF00) >> 8) / 255
        let alpha = CGFloat(rgba & 0x000000FF) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func colorWithRGBHexString(_ hexString: String) -> UIColor {
        if hexString == ""{
            
            return UIColor.white
        }else{
            var rgba: UInt32 = 0
            let scanner = Scanner(string: hexString)
            
            scanner.scanLocation = 1
            scanner.scanHexInt32(&rgba)
            
            return UIColor.colorWithRGBA((rgba << 8) | 0x000000FF)
        }
        
    }
}


extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
    var doubleValue:Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}


extension UnicodeScalar {
    
    var isEmoji: Bool {
        
        switch value {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF,   // Misc symbols
        0x2700...0x27BF,   // Dingbats
        0xFE00...0xFE0F,   // Variation Selectors
        0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs
        127000...127600, // Various asian characters
        65024...65039, // Variation selector
        9100...9300, // Misc items
        8400...8447: // Combining Diacritical Marks for Symbols
            return true
            
        default: return false
        }
    }
    
    var isZeroWidthJoiner: Bool {
        
        return value == 8205
    }
}

extension Float {
    var avoidNotation: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 10
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self) ?? ""
    }
}
 
 
extension String {
    
    var glyphCount: Int {
        
        let richText = NSAttributedString(string: self)
        let line = CTLineCreateWithAttributedString(richText)
        return CTLineGetGlyphCount(line)
    }
    
    var isSingleEmoji: Bool {
        
        return glyphCount == 1 && containsEmoji
    }
    
    var containsEmoji: Bool {
        
        return unicodeScalars.contains { $0.isEmoji }
    }
    
    var containsOnlyEmoji: Bool {
        
        return !isEmpty
            && !unicodeScalars.contains(where: {
                !$0.isEmoji
                    && !$0.isZeroWidthJoiner
            })
    }
    
    // The next tricks are mostly to demonstrate how tricky it can be to determine emoji's
    // If anyone has suggestions how to improve this, please let me know
    var emojiString: String {
        
        return emojiScalars.map { String($0) }.reduce("", +)
    }
    
    var emojis: [String] {
        
        var scalars: [[UnicodeScalar]] = []
        var currentScalarSet: [UnicodeScalar] = []
        var previousScalar: UnicodeScalar?
        
        for scalar in emojiScalars {
            
            if let prev = previousScalar, !prev.isZeroWidthJoiner && !scalar.isZeroWidthJoiner {
                
                scalars.append(currentScalarSet)
                currentScalarSet = []
            }
            currentScalarSet.append(scalar)
            
            previousScalar = scalar
        }
        
        scalars.append(currentScalarSet)
        
        return scalars.map { $0.map{ String($0) } .reduce("", +) }
    }
    
    fileprivate var emojiScalars: [UnicodeScalar] {
        
        var chars: [UnicodeScalar] = []
        var previous: UnicodeScalar?
        for cur in unicodeScalars {
            
            if let previous = previous, previous.isZeroWidthJoiner && cur.isEmoji {
                chars.append(previous)
                chars.append(cur)
                
            } else if cur.isEmoji {
                chars.append(cur)
            }
            
            previous = cur
        }
        
        return chars
    }
}


