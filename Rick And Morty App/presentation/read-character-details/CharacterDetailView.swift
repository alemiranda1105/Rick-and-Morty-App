//
//  CharacterDetailView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        List {
            Section {
                CharacterlmageView(image: character.image, size: CGSize(width: 400, height: 400))
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 400)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            
            Section {
                HStack {
                    Text("Status")
                        .bold()
                    Spacer()
                    Text("\(character.status.rawValue) \(character.status.getStatusIcon())")
                }
                HStack {
                    Text("Species")
                        .bold()
                    Spacer()
                    Text(character.species)
                }
                HStack {
                    Text("Gender")
                        .bold()
                    Spacer()
                    Text(character.gender.rawValue)
                }
            } header: {
                Text("Information")
            }
            
            Section {
                HStack {
                    Text("Origin")
                        .bold()
                    Spacer()
                    Text(character.origin.name)
                }
                HStack {
                    Text("Last seen in")
                        .bold()
                    Spacer()
                    Text(character.location.name)
                }
            } header: {
                Text("Location")
            }
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    CharacterDetailView(character: Character(
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
