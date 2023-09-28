//
//  ContentView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 27/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCharacter: Character?
    @State private var pushView = false
    
    var body: some View {
        NavigationStack {
            HomeView(characterService: CharacterService(characterRepository: CharacterRepository()))
                .navigationTitle("Home")
        }
        .tint(.accentColor)
    }
}

#Preview {
    ContentView()
}
