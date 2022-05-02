//
//  UITextFieldExtension.swift
//  MTA
//
//  Created by Tradesocio on 09/05/19.
//  Copyright © 2019 StrechCapitals. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

extension SkyFloatingLabelTextField{
    func setTextFieldStyle(disabledColor: UIColor, errorColor: UIColor, lineColor: UIColor,lineErrorColor: UIColor,textColor: UIColor, placeholderColor: UIColor, selectedTitleColor: UIColor,selectedLineColor: UIColor,titleColor: UIColor, textErrorColor: UIColor,titleErrorColor: UIColor, tintColor: UIColor, backgroundColor: UIColor, font: UIFont, placeholderFont: UIFont,layerBorderColor: UIColor,  attribute: NSMutableAttributedString? = nil){
        self.disabledColor = disabledColor
        self.errorColor = errorColor
        self.lineColor = lineColor
        self.lineErrorColor = lineErrorColor
        self.textColor = textColor
        self.placeholderColor = placeholderColor
        self.selectedTitleColor = selectedTitleColor
        self.selectedLineColor = selectedLineColor
        self.titleColor = titleColor
        self.textErrorColor = textErrorColor
        self.titleErrorColor = titleErrorColor
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.titleFont = placeholderFont
        self.placeholderFont = placeholderFont
        if attribute != nil{
            self.attributedPlaceholder = attribute
        }
        self.layer.borderColor = layerBorderColor.cgColor
        self.titleFormatter = {$0} // convert errormessge in lowercase
    }
    func setLeftPaddingPoints(_ amount:CGFloat?){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount ?? 0, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat?) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount ?? 0, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UITextField{
    func setTextFieldStyle(font: UIFont, textColor: UIColor, bgColor: UIColor,borderWidth: CGFloat, layerBorderColor: UIColor,placeholder:String){
        self.backgroundColor = bgColor
        self.font = font
        self.textColor = textColor
        self.tintColor = textColor
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = layerBorderColor.cgColor
        self.layer.cornerRadius = 2
        self.placeholder =  placeholder
    }
    func setLeftPadding(_ amount:CGFloat?){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount ?? 0, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPadding(_ amount:CGFloat?) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount ?? 0, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
   
}

