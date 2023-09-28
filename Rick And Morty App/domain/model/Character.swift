//
//  Character.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String?
    let gender: CharacterGender
    let origin: Location
    let location: Location
    let image: String
    let episode: Array<String>
    let url: String
}
