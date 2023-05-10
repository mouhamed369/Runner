//
//  ArticleDetailsView.swift
//  NebulaGaming
//
//  Created by Nebula Gaming on 19/4/2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
struct ArticleDetailsView: View {

    @State var image: String
    @State var link: String
    @State var content: String
    @State var title: String
    
    @State private var qrCodeImage: UIImage?
    @State private var showingQRCode = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .center) {
                    
                    AsyncImage(url: URL(string: image)) {
                        phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Image(systemName: "wifi.slash")
                        @unknown default:
                            Image("placeholder")
                        }
                    } .clipShape(Rectangle())
                    
                    VStack{
                        ShareSheet(link: link, title: title, message: "Share the news!")
                        
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .padding([.top, .bottom])
                            
                            Text(content)
                                .font(.body)
                                .foregroundColor(.primary)
                            
                            Button(action: {
                                if let url = URL(string: link) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Image(systemName: "link.circle")
                                    .foregroundColor(.blue)
                                    .font(.title)
                                    .padding()
                            }.tint(.accentColor)
                                .buttonStyle(.bordered)
                            
                            if showingQRCode {
                                    Image(uiImage: qrCodeImage ?? UIImage())
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 200, maxHeight: 200)
                            }
                        }
                    }.padding([.horizontal], 5)
                }
            }
        }.onAppear {
            generateQRCode()
        }
    }
    
    func generateQRCode() {
            let data = link.data(using: .utf8)!
            
            guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return }
            filter.setValue(data, forKey: "inputMessage")
            guard let qrCodeImage = filter.outputImage else { return }
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledQRCodeImage = qrCodeImage.transformed(by: transform)
            let context = CIContext()
            guard let cgImage = context.createCGImage(scaledQRCodeImage, from: scaledQRCodeImage.extent) else { return }
            
            self.qrCodeImage = UIImage(cgImage: cgImage)
            self.showingQRCode = true
        }
}
