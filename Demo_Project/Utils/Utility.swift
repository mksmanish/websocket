//
//  Utility.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import UIKit
import SVGKit

/// This is class will have commom methods which will be accessible throughout application.
class Utility : NSObject {
    
    static let shared = Utility()
    /**
     Makes rounded corner of a view
     
     - Parameter radius corner radius to set.
     - Parameter view to which border to be applied.
     */
    func makeRoundedBorder (radius:CGFloat , view:UIView ,bordercolor : UIColor , borderwidth : CGFloat)
    {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderColor=bordercolor.cgColor
        view.layer.borderWidth=borderwidth
    }
    
    /**
     Makes top corner rounded of a view
     
     - Parameter radius corner radius to set.
     - Parameter view to which border to be applied.
     */
    class func makeTopCornerRounded (radius:CGFloat , view:UIView )
    {
        let maskPathTop = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft
                                                                                     , .topRight], cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayerTop = CAShapeLayer()
        shapeLayerTop.frame = view.bounds
        shapeLayerTop.path = maskPathTop.cgPath
        view.layer.mask = shapeLayerTop
    }
    
    /**
     Makes bottom corner rounded of a view
     
     - Parameter radius corner radius to set.
     - Parameter view to which border to be applied.
     */
    class func makeBottomCornerRounded (radius:CGFloat , view:UIView )
    {
        let maskPathBottom = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomLeft
                                                                                        , .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayerBottom = CAShapeLayer()
        shapeLayerBottom.frame = view.bounds
        shapeLayerBottom.path = maskPathBottom.cgPath
        view.layer.mask = shapeLayerBottom
    }
    
    /*
     
     Method : createOverlayOnView
     this method creates overlay on the view passed.
     this is to have half rounded on the tableview
     
     */
    
    class func createOverlayOnView(getOverlayView: UIView, shouldApplyCornerRadius: Bool = true, isBig : Bool = false)
    {
        let maskLayer = CAShapeLayer()
        var radiusOverlay : CGFloat = 14.0
        let xOffset : CGFloat = getOverlayView.frame.size.width/2
        var yOffset : CGFloat = -(radiusOverlay/2)
        
        if isBig == true
        {
            radiusOverlay = 19.0
            yOffset = -3
        }
        // getOverlayView.frame.origin.y
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: xOffset, y: yOffset), radius: radiusOverlay, startAngle: 0.0, endAngle: 2 * 3.14, clockwise: false)
        path.addRect(CGRect(x: 0, y: 0, width: getOverlayView.frame.width + 5, height: getOverlayView.frame.height + 10))
        
        
        maskLayer.path = path;
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        //  let shadowPath = UIBezierPath(roundedRect: getOverlayView.bounds, cornerRadius: 10)
        
        // Release the path since it's not covered by ARC.
        getOverlayView.layer.mask = maskLayer
        if shouldApplyCornerRadius
        {
            getOverlayView.clipsToBounds = true
            getOverlayView.layer.cornerRadius = 10
        }
        
    }
    
    /// Function to convert the dictionary into string
    ///
    /// - Parameter dict: dictionary to convert into string
    /// - Returns: json string
    func getJsonString(dict :[String : AnyObject]) ->String
    {
        var jsonString = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            jsonString = String.init(data: jsonData, encoding: String.Encoding.utf8)!
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            if decoded is [String:String]
            {
                //Add print statement to check decoded string
            }
        } catch let error as NSError {
            print(error)
        }
        
        jsonString = jsonString.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil)
        jsonString = String(jsonString.filter { !"\n\t\r\\".contains($0) })
        
        return jsonString
    }
    
    /*
     
     Method : base64conversion
     This method is to convert string conversion to base64
     
     */
    
    func base64conversion(str : String) -> String
    {
        let utf8str = str.data(using: String.Encoding.utf8)
        
        if let base64Encoded = utf8str?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        {
            return base64Encoded
            
        }
        return ""
    }
    
    /**
     
     Method : getVersion
     This method returns the current app version
     
     */
    
    func getAppVersion() -> String {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return appVersion
    }
    
    /**
     
     Method : getFormatedDateFromString
     This method converts the string to given format
     
     */
    func getFormatedDateFromString(date:String) -> String{
        //To show the date & time in GMT+5:30 timezone
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = RMDateFormat.YYYYMMDD.rawValue
        let formattedDate = dateFormatter.date(from: date)
        //Check for formatted date
        if let _ = formattedDate
        {
            dateFormatter.dateFormat = RMDateFormat.DDMMMYYYY.rawValue
            var formattedString : String?
            formattedString = dateFormatter.string(from: formattedDate!)
            
            if let _ = formattedString
            {
                return formattedString!
            }
            else
            {
                return ""
            }
        }
        else
        {
            return ""
        }
    }
    
    /**
     
     Method : getFormatedDateFromString
     This method converts the string to given format
     
     */
    func getFormatedDateFromStringForCard(date:String) -> String{
        //To show the date & time in GMT+5:30 timezone
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = RMDateFormat.YYMM.rawValue
        let formattedDate = dateFormatter.date(from: date)
        //Check for formatted date
        if let _ = formattedDate
        {
            dateFormatter.dateFormat = RMDateFormat.YYMM.rawValue
            var formattedString : String?
            formattedString = dateFormatter.string(from: formattedDate!)
            
            if let _ = formattedString
            {
                return formattedString!
            }
            else
            {
                return ""
            }
        }
        else
        {
            return ""
        }
    }
    /**
     check if internet connection is available
     returns true or false
     */
    
    func isInternetAvailable() -> Bool {
        if (NetworkManager.sharedInstance.reachability != nil) {
            return true
        }else{
            return false
        }
    }
    
    /**
     Method Name : readPlist
     This method reads plist file according to font type.
     */
    
    func readPlist(plistName : String) -> String {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist"){
            return path
        }
        return ""
        
    }
    
    /// function to set svg image to view
    ///
    /// - Parameters:
    ///   - imgView: view to set svg
    ///   - name: name of image
    @objc func setSVG(imgView : UIImageView , name : String)
    {
        
        let path = Bundle.main.path(forResource: name, ofType: "svg")
        do{
            
            let svgData = try String(contentsOfFile: path!)
            let d = svgData.data(using: .utf8)
            let receivedIcon: SVGKImage = SVGKImage(data: d)
            let img = receivedIcon.uiImage
            imgView.image = img
            imgView.contentMode = .scaleAspectFit
            
        }
        catch let error{
            print("Error",error.localizedDescription)
        }
    }
    /// This method is used to update the page control with new UI
    /// - Parameter pager: as UIPageControl
    public func updatePageControl(pager: UIPageControl) {
        let sub = pager.subviews
        if sub.count > 0 {
            let sub1 = sub[0].subviews
            if sub1.count > 0 {
                let sub2 = sub1[0].subviews
                for (index, dot) in sub2.enumerated() {
                    if index == pager.currentPage {
                        dot.tintColor = .blue
                        dot.backgroundColor = .blue
                        dot.layer.cornerRadius = dot.frame.size.height / 2;
                        dot.layer.borderColor = UIColor.blue.cgColor
                    } else {
                        dot.tintColor = .clear
                        dot.backgroundColor = .clear
                        dot.layer.cornerRadius = dot.frame.size.height / 2
                        dot.layer.borderColor =  UIColor.blue.cgColor
                        dot.layer.borderWidth = 1
                    }
                }
            }
        }
    }
    
}
// Enum for storing date formats
enum RMDateFormat : String{
    case YYMM = "yyMM"
    case DDMMYYYY = "dd-MM-yyyy"
    case DDMMYYYYDot = "dd.MM.yyyy"
    case DDMMYY = "dd-MM-YY"
    case MMDDYYYY = "MM-dd-yyyy"
    case YYYYMMDDHHMM = "yyyy-MM-dd HH:mm"
    case YMMDDHMSSSSSS = "y-MM-dd H:m:ss.SSSS"
    case YYYYMMDD = "yyyy-MM-dd"
    case DDMMMYYYY = "dd MMM yyyy"
    case YYYYMMDDHHMMSSAAA = "yyyy-MM-dd'T'hh:mm:ss aaa"
    case YYYYMMDDHHMMSSAAANew = "yyyy-MM-dd hh:mm:ss aaa"
    case YYYYMMDDHHMMSS = "yyyy-MM-dd'T'hh:mm:ss"
    case DDMMM = "dd MMM"
    case YYYYMMDDTHHMMSS = "yyyy-MM-dd'T'HH:mm:ss"
    case YYYYMMDDTHHMMSSSSS = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case DDMMMYYYYWithComma = "dd MMM, yyyy"
    case mf_yyyyMMddHHmmss = "yyyyMMddHHmmss"
    case ddmmyyyy = "dd/MM/yyyy"
    case ddMMMYYYYHHMMAAA = "dd MMM yyyy hh:mm aaa"
    case ddMMMYYYYHHMMAAAWithComma = "dd MMM yyyy, hh:mm aaa"
    case MMDDYY = "MM/dd/yy"
    case yyyyMMDDHHMMSSSpace = "yyyy-MM-dd hh:mm:ss"
    case YYYYMMDDHHMMSSSSS = "yyyy-MM-ddHH:mm:ss.SSS"
    case YYYYMMMDDHHMM = "dd MMM yyyy HH:mm"
    case YYYYMMMDDHHMMSSZZZZ = "yyyy-MM-dd HH:mm:ssz"
    case YYYYMMMDDTHHMMSSZZZZ = "yyyy-MM-dd'T'HH:mm:ssz"
    case yyyyMMddforPaymentHistory  = "yyyyMMdd"
    case ddMMMyyyyforPaymentHistory  = "dd-MMM-yyyy"
    case ddMMMyyDCHistory  = "dd-MMM-yy"
    case DDMMYYYYWithSpace = "dd MM yyyy"
    case yyyyMMddHHmmssSpace = "yyyy-MM-dd HH:mm:ss"
    case MMYYYY = "MM/yyyy"
    case MMYY = "MM/yy"
    case DDMMMMMYYYY = "dd MMMM yyyy"
    case ddMMyyyyHHmmss = "dd-MM-yyyy HH:mm:ss"
    case YYYYMMDDTHHMMSSPlusFiveThirty = "yyyy-MM-dd'T'HH:mm:ss+05:30"
    case hmmaCommaMMMMddyyyy = "h:mm a, MMMM dd yyyy"
    case hmmaCommaddMMMMyyyy = "h:mm a, dd MMMM yyyy"
    case ddMMyyyyForUPI  = "ddMMyyyy"
    case YYYYMMDDHHMMSSSSSSpace = "yyyy-MM-dd HH:mm:ss.SSS"
}

