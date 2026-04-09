//
//  BookDetailView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/21/26.
//

import SwiftUI

struct BookDetailView: View {
    
    @Binding var book: Book
    
    @State private var showEditBookSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                    VStack{
                        Text(book.title)
                            .font(.headline)
                        if(!book.author.isEmpty){
                            Text("by: \(book.author)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        ColoredCapsule(text:book.genre.rawValue)
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        FavoriteToggle(isFavorite: $book.isFavorite)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                Text(book.summary)
                    .padding(.bottom)
                //
                HStack{
                    Text("My review")
                        .font(.title2)
                    Spacer()
                    ColoredCapsule(
                        text:book.readingStatus.rawValue,
                        color:.orange
                    )
                }.padding(.bottom)
                StarRatingView(rating: book.rating)
                Text(book.review)
                    .padding(8)
                Spacer()
            }
            .padding()
            .navigationTitle("Book Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Edit"){
                showEditBookSheet.toggle()
            })
            .sheet(
                isPresented: $showEditBookSheet,
                content: {
                    AddEditView(book: $book)
                }
            )
        }
    }
}
