//
//  CharacterRepositoryProtocol.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func getAllCharacters(page: Int) async throws -> GetAllCharactersResponse
    func searchCharactersByName(name: String, page: Int) async throws -> GetAllCharactersResponse
}
