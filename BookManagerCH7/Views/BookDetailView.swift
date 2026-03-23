//
//  BookDetailView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import SwiftUI

struct BookDetailView: View {
    
    @Binding var book: Book
    
    var body: some View {
        VStack{
            HStack{
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                VStack{
                    Text(book.title)
                        .font(.headline)
                    Text("by: \(book.author)")
                }
            }
            Text(book.summary)
            Button("Edit book"){
                book.title = "New Title"
            }
        }
        
    }
}
