//
//  Article.swift
//  AcronNews
//
//  Created by Omran Khoja on 12/26/19.
//  Copyright © 2019 AcronDesign. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}


struct Article: Decodable {
    let title: String
    let description: String
    
    func decodeJSON() {
        
    }
}
