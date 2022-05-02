//
//  UIButton+Extension.swift
//  Onco Power
//
//  Created by Tradesocio on 05/04/22.

import UIKit
import Photos
extension UIButton {
    
    func setButtonStyle(alpha: CGFloat,userInteraction:Bool,cornerRadius: CGFloat, backgroundColor: UIColor, font: UIFont, titleColor: UIColor, layerBorderColor: UIColor,borderWidth: CGFloat,text:String){
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.frame.width <= 200 ? (self.layer.cornerRadius = cornerRadius/2) : (self.layer.cornerRadius = cornerRadius)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = layerBorderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.alpha = alpha
        self.isUserInteractionEnabled = userInteraction
        self.setTitle(text, for: .normal)
       
    }
    
    func setAttributedButton(title: String, font: UIFont,buttonTextColor: UIColor){
        let attributes = [NSAttributedString.Key.font : self.getDynamicFontSizeForAttributedText(font: font), NSAttributedString.Key.foregroundColor : buttonTextColor]
        self.setAttributedTitle(NSAttributedString(string: title, attributes: attributes), for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func getDynamicFontSizeForAttributedText(font: UIFont)->UIFont{
        let currentFont = font
        var sizeScale: CGFloat = 1
        if DeviceInfo.IS_IPHONE_5 || DeviceInfo.IS_IPHONE_6{
            sizeScale = 1.0
        }else if DeviceInfo.IS_IPHONE_6P || DeviceInfo.IS_IPHONE_X{
            sizeScale = 1.10//
        }else if DeviceInfo.IS_IPHONE_XR{
            sizeScale = 1.15//
        }else if DeviceInfo.IS_IPAD{
            sizeScale = 1.30//
        }else if DeviceInfo.IS_IPAD_PRO10{
            sizeScale = 1.40//
        }else if DeviceInfo.IS_IPAD_PRO11{
            sizeScale = 1.50//
        }else if DeviceInfo.IS_IPAD_PRO12{
            sizeScale = 1.60//2.0
        }else{
            sizeScale = 1.10//
        }
        return currentFont.withSize((currentFont.pointSize) * sizeScale)
    }
    
    
    
    func buttonWithBorderColor(color:UIColor,backgroundColor:UIColor,borderWidth:CGFloat,cornerRadius:CGFloat){
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    
    func createButtonWithCircleBorder(backgroundColor:UIColor,borderColor:UIColor){
        self.backgroundColor = backgroundColor
        
        self.layer.cornerRadius = self.frame.height / 2
        
        self.layer.borderWidth = 1
        
        self.layer.borderColor = borderColor.cgColor
    }
    
    var badgeLabel : UILabel {
        get {
            return UILabel()
        }
    }
        
    var badge: String? {
        set{
            addBadgeToButon(badge: newValue)
        }
        get {
            return self.badge
        }
    }
    
    public var badgeBackgroundColor : UIColor{
        set {
            badgeLabel.backgroundColor = newValue
        }
        
        get{
            return UIColor.red
        }
    }
    
    public var badgeTextColor : UIColor {
        set {
            badgeLabel.textColor = newValue
        }
        get {
            return UIColor.white
        }
    }
    
    public var badgeFont : UIFont {
        set {
            badgeLabel.font = newValue
        }
        get {
            return UIFont.systemFont(ofSize: 12)
        }
    }
    
    public var badgeEdgeInsets: UIEdgeInsets? {
        set {
            addBadgeToButon(badge: badge)
        }
        get {
            return self.badgeEdgeInsets
        }
    }

    
    func addBadgeToButon(badge: String?) {
        badgeLabel.text = badge
        badgeLabel.textColor = badgeTextColor
        badgeLabel.backgroundColor = badgeBackgroundColor
        badgeLabel.font = badgeFont
        badgeLabel.sizeToFit()
        badgeLabel.textAlignment = .center
        let badgeSize = badgeLabel.frame.size
        
        let height = max(18, Double(badgeSize.height) + 5.0)
        let width = max(height, Double(badgeSize.width) + 10.0)
        
        var vertical: Double?, horizontal: Double?
        if let badgeInset = self.badgeEdgeInsets {
            vertical = Double(badgeInset.top) - Double(badgeInset.bottom)
            horizontal = Double(badgeInset.left) - Double(badgeInset.right)
            
            let x = (Double(bounds.size.width) - 10 + horizontal!)
            let y = -(Double(badgeSize.height) / 2) - 10 + vertical!
            badgeLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            let x = self.frame.width - CGFloat((width / 2.0))
            let y = CGFloat(-(height / 2.0))
            badgeLabel.frame = CGRect(x: x, y: y, width: CGFloat(width), height: CGFloat(height))
        }
        
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
        badgeLabel.layer.masksToBounds = true
        addSubview(badgeLabel)
        badgeLabel.isHidden = badge != nil ? false : true
    }
    
}
