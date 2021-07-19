//
//  PlusCode.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import Foundation

// MARK: - PlusCode
struct PlusCode: Codable {
    let compoundCode, globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}
