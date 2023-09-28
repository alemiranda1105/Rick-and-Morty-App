//
//  ResponseInformation.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import Foundation

struct ResponseInformation: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
