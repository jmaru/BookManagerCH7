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
    
    @State var selectedCover: String = "lotr_fellowship"
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height: 150)
                    Picker("Cover", selection: $book.cover){
                        Text("The Fellowship of the ring").tag("lotr_fellowship")
                        Text("The Two Towers").tag("lotr_towers")
                        Text("The Return of the King").tag("lotr_king")
                    }
                }
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode( .inline )
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        //append to books
                        //reset current book
                        dismiss()
                    }
                }
            }
        }
    }
}
