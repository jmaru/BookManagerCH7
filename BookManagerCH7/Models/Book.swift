//
//  Book.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var summary: String
    var cover: String
    
    var rating: Int = 0
    var review: String = ""
    
    var isFavorite: Bool = false
}
