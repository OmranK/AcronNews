//
//  NewsListTableViewController.File.swift
//  AcronNews
//
//  Created by Omran Khoja on 12/26/19.
//  Copyright © 2019 AcronDesign. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3c7fe5671981424ab121d217e2b36fc2")!
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM?.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM?.title
        cell.descriptionLabel.text = articleVM?.description
        return cell
    }
}
