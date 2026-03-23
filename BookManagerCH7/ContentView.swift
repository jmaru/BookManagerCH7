//
//  ContentView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    private let books = getBooks()

    var body: some View {
        NavigationStack {
            List(books){ book in
                NavigationLink(destination: BookDetailView(book: book)){
                    BookListItem(book: book)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
