//
//  PlacesAPI.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

// MARK: - Welcome
struct PlacesAPI: Codable {
    let htmlAttributions: [String]?
    let nextPageToken: String?
    let results: [PlacesAPIResult]?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results, status
    }
}
