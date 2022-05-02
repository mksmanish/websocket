//
//  UILabelExtension.swift
//  MTA
//
//  Created by Tradesocio on 09/05/19.
//  Copyright © 2019 StrechCapitals. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setLabelStyle(textColor: UIColor,text:String){
        self.textColor = textColor
        self.text = text
    }
    
    func setNoRecordLabel(alpha: CGFloat,font: UIFont,textColor: UIColor,noOfLines:Int,text:String){
        self.textColor = textColor
        self.alpha = 1
        self.textAlignment = .center
        self.font = font
        self.numberOfLines = 0
        self.text = text
        self.lineBreakMode = .byTruncatingTail

    }
    func setAttributedLabel(firstStrColor: UIColor,secondStrColor: UIColor, seperatorString: String.Element, labelText: String){
        self.text = labelText
        let bottomLabel = self.text?.split(separator: seperatorString)
        let firstStr: String = String(bottomLabel![0])
        let secondStr: String = String(bottomLabel![1])
        let firstStrRange = (self.text! as NSString).range(of: firstStr)
        let secondStrRange = (self.text! as NSString).range(of: secondStr)
        let attribute = NSMutableAttributedString.init(string: self.text ?? "")
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: secondStrColor , range: secondStrRange)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: firstStrColor , range: firstStrRange)
        self.attributedText = attribute
    }
    
    func setAttributedLabel(firstStrFont: UIFont,secondStrFont: UIFont, seperatorString: String.Element, labelText: String){
        self.text = labelText
        let bottomLabel = self.text?.split(separator: seperatorString)
        let firstStr: String = String(bottomLabel![0])
        let secondStr: String = String(bottomLabel![1])
        let firstStrRange = (self.text! as NSString).range(of: firstStr)
        let secondStrRange = (self.text! as NSString).range(of: secondStr)
        let attribute = NSMutableAttributedString.init(string: self.text ?? "")
        attribute.addAttribute(NSAttributedString.Key.font, value: firstStrFont , range: firstStrRange)
        attribute.addAttribute(NSAttributedString.Key.font, value: secondStrFont , range: secondStrRange)
        self.attributedText = attribute
    }

    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }
        
        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0
        var insetsWidth: CGFloat = 0.0
        
        if let insets = padding {
            insetsWidth += insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
            textWidth -= insetsWidth
        }
        
        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: self.font!], context: nil)
        
        contentSize.height = ceil(newSize.size.height) + insetsHeight
        contentSize.width = ceil(newSize.size.width) + insetsWidth
        
        return contentSize
    }
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    init?(htmlEncodedString: String) {
        
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
        
    }
    
}

class ResultLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        accessibilityValue = text
    }

    override var text: String? {
        didSet {
            accessibilityValue = text
        }
    }
}
