//
//  JsonDecoder.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

func decodeJsonData<T: Codable>(data: Data) throws -> T {
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        throw NetworkHandlerError.JSONDecodingError
    }
}
