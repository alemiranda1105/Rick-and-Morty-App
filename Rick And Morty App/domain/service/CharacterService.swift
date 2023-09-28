//
//  CharacterService.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

class CharacterService {
    private let characterRepository: CharacterRepositoryProtocol
    
    init(characterRepository: CharacterRepositoryProtocol) {
        self.characterRepository = characterRepository
    }
    
    func getAllCharacters(page: Int = 1) async -> (GetAllCharactersResponse?, String?) {
        do {
            let characters = try await self.characterRepository.getAllCharacters(page: page)
            return (characters, nil)
        } catch {
            return (nil, error.localizedDescription)
        }
    }
}
