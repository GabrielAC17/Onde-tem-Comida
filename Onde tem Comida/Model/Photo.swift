//
//  Photo.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let height: Int?
    let htmlAttributions: [String]?
    let photoReference: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}
