//
//  CharacterGender.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "Unknown"
    
    public init(from decoder: Decoder) throws {
        self = try CharacterGender(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
