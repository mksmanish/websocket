//
//  ObservableOjects.swift
//  Demo_Project
//
//  Created by Tradesocio on 24/04/22.
//

import Foundation


final class ObservabObjec<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    //for singgle listener
    private var listener: ((T) -> Void)?
    
    
    // for multiple listener
   // var listener : [((T?) -> Void)]?
    
    init(_ value:T) {
        
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
