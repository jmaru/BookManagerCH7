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
    @State var showFilters: Bool = false
    
    @AppStorage("SETTINGS_GRID_COLUMNS_KEY") private var gridColumns: Int = 2
    
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem]{
//        [GridItem(.flexible()), GridItem(.flexible())]
        Array(repeating: GridItem(.flexible()), count: gridColumns)
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
                    }.padding(.all, CGFloat(8/gridColumns))
                }
            }
            .navigationTitle("Favorite Books")
            .navigationBarItems(leading: Button("Filter"){
                showFilters.toggle()
            })
            .sheet(
                isPresented: $showFilters,
                content: {
                    FiltersView(
                        selectedGenre: $selectedGenre,
                        selectedReadingStatus: $selectedReadingStatus
                    )
                }
            )
        }
    }
}


