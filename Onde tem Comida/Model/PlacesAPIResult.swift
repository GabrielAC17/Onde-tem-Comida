//
//  PlacesAPIResult.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

// MARK: - Welcome
struct PlacesAPIResult: Codable, Identifiable {
    let id = UUID()
    
    let businessStatus: String?
    let geometry: Geometry?
    let icon: String?
    let name: String?
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String?
    let plusCode: PlusCode?
    let priceLevel: Int?
    let rating: Double?
    let reference, scope: String?
    let types: [String]?
    let userRatingsTotal: Int?
    let vicinity: String?

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case geometry, icon, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case priceLevel = "price_level"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}
