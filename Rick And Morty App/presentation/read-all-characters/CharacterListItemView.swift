//
//  CharacterListItemView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import SwiftUI

struct CharacterListItemView: View {
    let character: Character
    var body: some View {
        NavigationLink {
            CharacterDetailView(character: character)
        } label: {
            HStack(spacing: 15) {
                CharacterSmalllmageView(image: character.image, size: CGSize(width: 60, height: 60))
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(character.name)
                        .fontWeight(.semibold)
                    Text(character.species)
                        .font(.callout)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(character.status.getStatusIcon()) \(character.status.rawValue) - \(character.species)")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    CharacterListItemView(character: Character(
        id: 1,
        name: "John",
        status: .alive,
        species: "Human",
        type: nil,
        gender: .male,
        origin: Location(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"),
        location: Location(name: "Mars", url: "https://rickandmortyapi.com/api/location/3"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: ["https://rickandmortyapi.com/api/episode/1",
                  "https://rickandmortyapi.com/api/episode/2",
                  "https://rickandmortyapi.com/api/episode/3",
                  "https://rickandmortyapi.com/api/episode/4",
                  "https://rickandmortyapi.com/api/episode/5",
                  "https://rickandmortyapi.com/api/episode/6",
                  "https://rickandmortyapi.com/api/episode/7",
                  "https://rickandmortyapi.com/api/episode/8",
                  "https://rickandmortyapi.com/api/episode/9",
                  "https://rickandmortyapi.com/api/episode/10",
                  "https://rickandmortyapi.com/api/episode/11",
                  "https://rickandmortyapi.com/api/episode/12"],
        url: "https://rickandmortyapi.com/api/character/1")
    )
}
