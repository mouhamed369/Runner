//
//  HomeController.swift
//  Runner
//
//  Created by mohamed on 14/4/2023.
//

import UIKit
import SwiftUI


class HomeController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let detailsSegId = "details"
    
    var articles = [Article]()
    
    @IBOutlet weak var articlesList: UITableView!
    
    let articlesVm = ArticlesViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        
        let cv = cell.contentView
        //let articleCover = cv.viewWithTag(1) as! UIImageView
        let articleTitle = cv.viewWithTag(2) as! UILabel
        let articleDescription = cv.viewWithTag(3) as! UITextView
        
        let article = articles[indexPath.row]
        
        articleTitle.text = article.title
        articleDescription.text = article.content
        
        return cell
   }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Task {
                await articlesVm.downloadArticles()
            self.articles = articlesVm.articles
        }
    }
    
  
    
   
    @IBAction func GoToDetails(_ sender: Any) {
        performSegue(withIdentifier: detailsSegId, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier ) == detailsSegId {
            let dest = segue.destination as! DetailsViewController
            let index = sender as! IndexPath
            dest.articleId = articles[index.row].aId!
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func bb(_ sender: Any) {
        let  contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }
    
}
