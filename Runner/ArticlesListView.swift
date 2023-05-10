import Foundation
import SwiftUI



struct ArticlesListView: View {
    
    @StateObject var vM = ArticlesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if vM.isLoading {
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2, anchor: .center)
                            .padding(.top, 100)
                    }
                    
                    ForEach(vM.articles) { art in
                        ItemCard(image: art.image, link: art.link, content: art.content, title: art.title, navDest: AnyView(ArticleDetailsView(image: art.image, link: art.link, content: art.content, title: art.title)))
                    }
                }.padding(10)
            }
        }
    }
}
