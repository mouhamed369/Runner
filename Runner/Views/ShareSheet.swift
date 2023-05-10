//
//  ShareSheet.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 29/4/2023.
//

import SwiftUI

struct ShareSheet: View {
    
    let link: String
    let title: String
    let message: String
    
    var body: some View {
        
        VStack {
            ShareLink(
                item: link,
                message: Text(message),
                preview: SharePreview(
                    title,
                    image: Image("logonv")
                )
            )  {
                Label("Share it", systemImage: "link").font(.title3)
            }
        }
    }
}

struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet(link:"https://google.com",
                   title:"Google site",
                   message: "Share it with your friends!")
    }
}
