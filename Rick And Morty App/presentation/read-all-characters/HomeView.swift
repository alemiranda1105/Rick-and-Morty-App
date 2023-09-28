//
//  HomeView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import SwiftUI

struct HomeView: View {
    let characterService: CharacterService
    @State private var characters: [Character] = []
    @State private var allCharactersResponse: GetAllCharactersResponse? = nil
    @State private var error: String? = nil
    @State private var currentPage = 1
    @State private var loading = true
    
    @State private var searchText = ""
    @State private var searchResults = [Character]()
    
    init(characterService: CharacterService, allCharactersResponse: GetAllCharactersResponse? = nil, error: String? = nil, currentPage: Int = 1, loading: Bool = true) {
        self.characterService = characterService
        self.allCharactersResponse = allCharactersResponse
        self.error = error
        self.currentPage = currentPage
        self.loading = loading
    }
    
    func fetchData() async {
        let (response, errorMessage) = await characterService.getAllCharacters(page: currentPage)
        error = errorMessage
        if let response = response {
            allCharactersResponse = response
            characters.append(contentsOf: response.results)
        }
    }
    
    func loadAllCharacters() async {
        loading = true
        await fetchData()
        loading = false
    }
    
    func loadNextPage() async {
        if allCharactersResponse?.info.next != nil {
            currentPage += 1
            await fetchData()
        }
    }
    
    func loadSearch() async {
        if allCharactersResponse?.info.next != nil {
            let (response, errorMessage) = await characterService.searchCharacterByName(name: searchText, page: currentPage)
            error = errorMessage
            if let response = response {
                allCharactersResponse = response
                searchResults = response.results
            }
            
        }
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
                List(searchText.isEmpty ? characters : searchResults) { character in
                    CharacterListItemView(character: character)
                        .onAppear {
                            Task {
                                await loadNextPage()
                            }
                        }
                }
                .searchable(text: $searchText)
                .onChange(of: searchText) {
                    if (searchText.count >= 3) {
                        Task {
                            await loadSearch()
                        }
                    }
                }
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
    HomeView(characterService: CharacterService(characterRepository: CharacterRepository()))
}
