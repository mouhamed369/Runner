//
//  Chip.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 30/4/2023.
//

import SwiftUI

struct Chip: View {
    
    let text: String
    
    var body: some View {
        Button {} label: {
            HStack {
                Text(text)
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                
                Image(systemName: "number.circle")
                    .foregroundColor(.black)
                    .frame(width: 16, height: 16)
            }
        }.tint(.primary)
            .padding([.horizontal],4)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.gray.opacity(0.4)))
    }
}
struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(text:"test")
    }
}
