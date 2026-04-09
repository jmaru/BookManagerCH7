//
//  ContentView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var books = getBooks()
    
    var body: some View {
        
        TabView{
            BookListView(books: $books)
                .tabItem{
                    Label("Books",systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem {
                    Label("Favorites",systemImage: "heart.fill")
            }
        }
    }
}


#Preview {
    ContentView()
}
