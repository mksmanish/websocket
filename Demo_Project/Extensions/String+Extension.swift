//
//  String+Extension.swift
//  Demo_Project
//
//  Created by Tradesocio on 24/04/22.
//

import Foundation

extension String{
    func localizableString(loc:String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


