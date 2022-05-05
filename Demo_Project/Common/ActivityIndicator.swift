//
//  ActivityIndicator.swift
//  Demo_Project
//
//  Created by Tradesocio on 08/04/22.
//

import Foundation
import UIKit
public class ActivityLoader{
    
    var overlayView : UIImageView?
    var activityIndicator : UIActivityIndicatorView!
    var isLoadingOverlayShowing : Bool = false
    class var shared: ActivityLoader {
        struct Static {
            static let instance: ActivityLoader = ActivityLoader()
        }
        return Static.instance
    }
    
    private init(){
        
        self.overlayView = UIImageView()
        self.activityIndicator = UIActivityIndicatorView()
        overlayView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height)
        overlayView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        overlayView?.clipsToBounds = true
        overlayView?.layer.cornerRadius = 0
        overlayView?.layer.zPosition = 1
        overlayView?.isUserInteractionEnabled = true
        let imageView = UIImageView()
        imageView.frame = CGRect(x: (overlayView?.bounds.width)! / 2 - 40, y: (overlayView?.bounds.height)! / 2 - 40, width: 80, height: 80)
        imageView.backgroundColor = UIColor.clear
        imageView.loadGif(name: "redSpinner")
        overlayView?.addSubview(imageView)
    }
    
    public func showloader(view: UIView) {
        self.isLoadingOverlayShowing = true
        overlayView?.center = view.center
        view.addSubview(overlayView!)
        activityIndicator.startAnimating()
        overlayView?.isUserInteractionEnabled = true
    }
    
    public func showloader() {
        self.isLoadingOverlayShowing = true
        activityIndicator.startAnimating()
        overlayView?.isUserInteractionEnabled = true
    }
    
    public func hideloader() {
        DispatchQueue.main.async {
            self.isLoadingOverlayShowing = false
            self.activityIndicator.stopAnimating()
            self.overlayView?.removeFromSuperview()
        }
    }
}
