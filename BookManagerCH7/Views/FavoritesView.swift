//
//  FavoriteView.swift
//  BookManagerCH7
//
//  Created by Arturo Martinez on 4/4/26.
//

import SwiftUI

struct FavoritesView:View {
    
    @Binding var books: [Book]
    
    @State var selectedGenre: Genre? = nil
    @State var selectedReadingStatus: ReadingStatus? = nil
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem]{
        [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if favoriteBooks.isEmpty {
                    Text("No favorite books yet").foregroundStyle(.secondary)
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


