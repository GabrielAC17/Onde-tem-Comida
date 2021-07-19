//
//  PlacesViewModel.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

class PlacesViewModel{
    let location = LocationHelper()
    
    public func getAvailablePlaces(completion:@escaping ([PlacesAPIResult]) -> ()) {
        let api = GooglePlacesAPI()
        
        //Enable if you want to use GPS
//        location.run { location in
//            print("Got Location")
//            api.loadData(latitude: location?.coordinate.latitude ?? 0, longitude: location?.coordinate.longitude ?? 0) { result in
//                completion(result)
//            }
//        }
        
        api.loadData(latitude: -25.4284, longitude: -49.2733) { result in
            completion(result)
        }
    }
}
