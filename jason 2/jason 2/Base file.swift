//
//  Base file.swift
//  jason 2
//
//  Created by Droadmin on 6/19/23.
//

import Foundation
struct ResultItem: Codable{
    var feed : Feed?
    
    enum CodingKeys: String,CodingKey{
        case feed = "feed"
    }
    init(from decoder: Decoder)throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feed = try values.decodeIfPresent(Feed.self,forKey: .feed)
    }
}
struct Feed: Codable{
    var entry : [Entry]?
    
    enum CodingKeys: String,CodingKey{
        case entry = "entry"
    }
    init(from decoder: Decoder)throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        entry = try values.decodeIfPresent([Entry].self,forKey: .entry)
    }
}
struct Entry: Codable{
    var category: Category?
    
    enum CodingKeys: String,CodingKey{
        case category = "category"
    }
    init(from decoder: Decoder)throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(Category.self,forKey: .category)
    }
}
struct Category: Codable{
    var attributes: Attributes?
    enum CodingKeys: String,CodingKey{
        case attributes = "attributes"
    }
    init(from decoder: Decoder)throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attributes = try values.decodeIfPresent(Attributes.self,forKey: .attributes)
    }
}
struct Attributes: Codable{
    var term: String?
    enum CodingKeys: String,CodingKey{
        case term = "term"
    }
    init(from decoder: Decoder)throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        term = try values.decodeIfPresent(String.self,forKey: .term)
    }
}
