//
//  CharacterRepository.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

class CharacterRepository: CharacterRepositoryProtocol {
    func getAllCharacters(page: Int) async throws -> GetAllCharactersResponse {
        guard let url = URL(string: "\(NetworkConstants.ALL_CHARACTERS_ENDPOINT)?page=\(page)") else {
            throw NetworkHandlerError.InvalidURL
        }
        
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == NetworkStatus.OK.rawValue else {
            let error: ResponseErrorMessage = try decodeJsonData(data: data)
            throw NetworkHandlerError.RequestError(error.error)
        }
        
        guard let decodedData: GetAllCharactersResponse = try decodeJsonData(data: data) else {
            throw NetworkHandlerError.UnknownError
        }
        
        return decodedData
    }
    
    
}
