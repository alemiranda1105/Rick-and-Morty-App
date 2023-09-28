//
//  HomeView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import SwiftUI

struct HomeView: View {
    let characterService = CharacterService(characterRepository: CharacterRepository())
    @State private var allCharactersResponse: GetAllCharactersResponse? = nil
    @State private var error: String? = nil
    @State private var currentPage = 1
    @State private var loading = true
    
    func loadAllCharacters() async {
        loading = true
        (allCharactersResponse, error) = await characterService.getAllCharacters(page: currentPage)
        loading = false
    }
    
    var body: some View {
        Group {
            if loading {
                ProgressView("Loading...⏳")
            } else if error != nil {
                VStack {
                    Text("Something went wrong 🫡")
                        .font(.title)
                    Text(error!)
                        .font(.callout)
                    Spacer()
                    Button {
                        Task {
                            await loadAllCharacters()
                        }
                    } label: {
                        Text("Retry")
                            .padding(5)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Text("\(allCharactersResponse!.info.pages)")
            }
        }
        .refreshable {
            Task {
                await loadAllCharacters()
            }
        }
        .task {
            await loadAllCharacters()
        }
    }
}

#Preview {
    HomeView()
}
