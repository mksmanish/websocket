//
//  Collection+Extension.swift
//
//  Created by Tradesocio on 05/04/22.
//

import Foundation

extension Array where Element == Double {
    
    var median: Double {
        let sorted = self.sorted()
        let length = self.count
        
        if (length % 2 == 0) {
            return (Double(sorted[length / 2 - 1]) + Double(sorted[length / 2])) / 2.0
        }
        
        return Double(sorted[length / 2])
    }
}
