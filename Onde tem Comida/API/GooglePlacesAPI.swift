//
//  GooglePlacesAPI.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

class GooglePlacesAPI: ObservableObject {
    @Published var results = [PlacesAPIResult]()
    
    func loadData(latitude: Double, longitude: Double, completion:@escaping ([PlacesAPIResult]) -> ()) {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
              let value = dict["google_api"] as? String,
              let stringURL = ("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude ),\(longitude)&opennow=true&rankby=distance&types=cafe|bar|restaurant&key=\(String(value))").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: stringURL) else {
            print("Invalid url...")
            return
        }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil, let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let places = try decoder.decode(PlacesAPI.self, from: responseData)
                        if let results = places.results {
                            print(results)
                            DispatchQueue.main.async {
                                completion(results)
                            }
                        } else {
                            completion([])
                        }
                    } catch DecodingError.dataCorrupted(let context) {
                        print(context)
                    } catch DecodingError.keyNotFound(let key, let context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.valueNotFound(let value, let context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.typeMismatch(let type, let context) {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                    
                }
                else{
                    completion([])
                }
            }.resume()
            
        }
}
