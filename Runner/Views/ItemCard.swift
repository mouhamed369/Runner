//
//  ItemCard.swift
//  Runner
//
//  Created by mohamed on 3/5/2023.
//

import SwiftUI

struct ItemCard: View {
    
    @State var image: String
    @State var link: String
    @State var content: String
    @State var title: String
    @State var navDest: AnyView
    
    var body: some View {
        NavigationLink(destination: navDest) {
            VStack {
                AsyncImage(url: URL(string: image)
                ) {
                    phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image("placeholder").resizable().scaledToFit()
                    @unknown default:
                        Image("placeholder")
                    }
                }
                
                HStack {
                    VStack(alignment: .center) {
                        Text(title)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(content)
                            .lineLimit(5)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                }
                .padding()
            }
            .onTapGesture {
                openLink(link: link)
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.7), lineWidth: 3)
            )
            .padding([.top])
        }
    }
    
}
