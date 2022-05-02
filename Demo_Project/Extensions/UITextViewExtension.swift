//
//  UITextViewExtension.swift
//  MTA
//
//  Created by Tradesocio on 09/05/19.
//  Copyright © 2019 StrechCapitals. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func setTextViewStyle(font: UIFont,textColor: UIColor, borderWidth: CGFloat, borderColor: UIColor){
        self.font = font
        self.textColor = textColor
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        if self.layer.borderColor != UIColor.clear.cgColor{
            self.layer.cornerRadius = 2
        }
    }
}

extension UITextView: UITextViewDelegate {
    
    func toolbarview(){
        let toolbar = UIToolbar()
        self.inputAccessoryView = toolbar
        toolbar.barStyle = UIBarStyle.default
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark{
                toolbar.backgroundColor = UIColor.darkGray
                toolbar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                toolbar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        } else {
            toolbar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        toolbar.isTranslucent = true
        
     //   let doneButton = UIBarButtonItem(title: AppDelegate.delegate?.languageLabels?.lbl_done ?? "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       // toolbar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
    }
    @objc func donePressed(){
        self.endEditing(true)
       // NotificationCenter.default.post(name:.toolsBarButtonAction,object: nil,userInfo: nil)
    }
    
}

