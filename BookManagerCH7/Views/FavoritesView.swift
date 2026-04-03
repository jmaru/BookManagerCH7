//
//  FavoritesView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 4/2/26.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var books: [Book]
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books)
    }
    
    private var gridLayout: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    } //
    var body: some View {
        

        NavigationStack{
            ScrollView{
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else{
                    LazyVGrid(columns: gridLayout){
                        ForEach(favoriteBooks){ book in
                            SquareCardView(book:book)
                        }
                    }.padding(.horizontal)
                }
            }
            .navigationTitle("My favorite books")
                
        }
    }
}
