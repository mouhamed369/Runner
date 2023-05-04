//
//  AboutView.swift
//  Runner
//
//  Created by mohamed on 4/5/2023.
//

import SwiftUI
import StoreKit

struct AboutView: View {
    @State var scale : CGFloat = 1
    let rouge = Color(red: 0.2, green: 0.2, blue: 0.2)
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("About Us")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 20) {
                    Image("pngfind.com-flash-logo-png-52884")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                HStack(spacing: 20) {
                    Text("Mouhamed\n Messaoudi")
                        .font(.headline)
                 
                }
                HStack(spacing: 20) {
                    Button(action: {
                        if let url = URL(string: "https://www.linkedin.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "link.circle")
                            .foregroundColor(.blue)
                            .font(.title)
                            .padding()
                    }
                   
                }
                Button(action : {
                    SKStoreReviewController.requestReview()
                }){
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                
                }
                }
            
                  ForEach (1...50, id:\.self) { _ in
                      
                      Circle ()
                          .foregroundColor(Color (red: .random(in: 0.3...1),
                                                  green: 0.1,
                                                  blue: .random(in: 0.3...1)))
                      
                          .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                          .animation (Animation.spring (dampingFraction: 0.5)
                                          .repeatForever()
                                          .speed (.random(in: 0.05...0.4))
                                          .delay(.random (in: 0...1)), value: scale
                          )
                      
                          .scaleEffect(self.scale * .random(in: 0.1...3))
                          .frame(width: .random(in: 1...100),
                                 height: CGFloat.random (in:20...100),
                                 alignment: .center)
                          .position(CGPoint(x: .random(in: 0...1112),
                                            y: .random (in:0...834)))
                      
                      
                  }
              }
              .onAppear {
                  self.scale = 1.2 // default circle scale
              }
              
              .drawingGroup(opaque: false, colorMode: .linear)
              .background(
                  Rectangle()
                      .foregroundColor(rouge))
              .ignoresSafeArea()
        }
        
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
