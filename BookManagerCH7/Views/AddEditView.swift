//
//  AddEditView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/23/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var summary: String = ""
    @State var rating: Int = 0
    @State var review: String = ""
    @State var genre: Genre = .unknown
    @State var readingStatus: ReadingStatus = .unknown
    
    @State var cover: String = "lotr_fellowship"
    
    init(book: Binding<Book>){
        self._book = book
        self._title = .init(wrappedValue: book.wrappedValue.title)
        self._author = .init(wrappedValue: book.wrappedValue.author)
        self._summary = .init(wrappedValue: book.wrappedValue.summary)
        self._rating = .init(wrappedValue: book.wrappedValue.rating)
        self._review = .init(wrappedValue: book.wrappedValue.review)
        self._genre = .init(wrappedValue: book.wrappedValue.genre)
        self._readingStatus = .init(wrappedValue: book.wrappedValue.readingStatus)
        self._cover = .init(wrappedValue: book.wrappedValue.cover)
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    Picker("Cover", selection: $cover){
                        Text("The Fellowship of the ring").tag("lotr_fellowship")
                        Text("The Two Towers").tag("lotr_towers")
                        Text("The Return of the King").tag("lotr_king")
                    }
                }
                Section(header: Text("My review")){
                    Picker("Reading Status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                    }
                    Picker("Rating", selection: $rating){
                        Text("No rating selected...").tag(0)
                        ForEach(1...5, id: \.self){ num in
                            Text(String(num)).tag(num)
                        }
                    }
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(book.title.isEmpty ? "Add book" :"Edit book")
            .navigationBarTitleDisplayMode( .inline )
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        book.title = title
                        book.author = author
                        book.summary = summary
                        book.rating = rating
                        book.review = review
                        book.cover = cover
                        book.genre = genre
                        book.readingStatus = readingStatus
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
