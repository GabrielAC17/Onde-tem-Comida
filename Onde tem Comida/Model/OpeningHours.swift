//
//  OpeningHours.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

// MARK: - OpeningHours
struct OpeningHours: Codable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}
