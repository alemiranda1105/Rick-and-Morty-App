//
//  GetAllCharactersResponse.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    let info: ResponseInformation
    let results: Array<Character>
}
