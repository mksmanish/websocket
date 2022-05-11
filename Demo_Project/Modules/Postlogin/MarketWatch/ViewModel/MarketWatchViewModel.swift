//
//  MarketWatchViewModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 28/04/22.
//

import Foundation
///This class is for handling view model of marketWatch.
class MarketWatchViewModel  {
    
    var errormsg:ObservabObjec<String> = ObservabObjec("")
    
    func getFavouritesAPI(complete:@escaping(FavouitesModel,String) -> ()) {
        
        APIClient.getfavouriteData(completion: { (result) in
            switch result {
            case .success(let FavoritesResult):
                let  Result = FavoritesResult
                complete(Result, "")
            case .failure(let error):
                self.errormsg = ObservabObjec(error.localizedDescription)
                print(error.localizedDescription)
            }
            
        }) { (failure) in
            self.errormsg = ObservabObjec(failure)
            print(failure)
            
        }
    }
    
}
