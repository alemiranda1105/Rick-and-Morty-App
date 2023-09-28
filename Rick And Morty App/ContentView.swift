//
//  ContentView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 27/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Home")
        }
        .tint(.accentColor)
    }
}

#Preview {
    ContentView()
}
