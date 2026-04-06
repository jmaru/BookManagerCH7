//
//  FavoriteView.swift
//  BookManagerCH7
//
//  Created by Arturo Martinez on 4/4/26.
//

import SwiftUI

struct FavoritesView:View {
    
    @Binding var books: [Book]
    
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(book: books)
    }
    
    private var gridLayout: [GridItem]{
        [GridItem(.flexible()),GridItem(.flexible())]
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if favoriteBooks.isEmpty {
                    Text("No favorite book").foregroundStyle(.secondary)
                }else{
                    LazyVGrid(columns:gridLayout){
                        ForEach(favoriteBooks){ book in
                            SquareCardView(book: book)
                            
                        }
                    }.padding()
                }
            }.navigationTitle("Favorite Books")
        }
    }
}


