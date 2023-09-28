//
//  CharacterlmageView.swift
//  Rick And Morty App
//
//  Created by Alejandro Miranda on 28/9/23.
//

import SwiftUI

struct CharacterlmageView: View {
    let image: String
    let size: CGSize
    var body: some View {
        AsyncImage(url: URL(string: image)!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
            } else if phase.error != nil {
                Color.gray
                    .frame(width: size.width, height: size.height)
            } else {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            }
        }
    }
}

#Preview {
    CharacterlmageView(image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", size: CGSize(width: 160, height: 160))
}
