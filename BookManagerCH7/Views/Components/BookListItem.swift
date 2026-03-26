//
//  BookListItem.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import SwiftUI

struct BookListItem: View {
    var book: Book
    
    var body: some View {
        HStack{
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
            VStack(alignment: .leading){
                Text(book.title)
                    .font(.headline)
                if(!book.author.isEmpty){
                    Text("by \(book.author)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                if(book.rating >= 1){
                    StarRatingView(rating: book.rating, style:.compact)
                }
            }
        }
    }
}
