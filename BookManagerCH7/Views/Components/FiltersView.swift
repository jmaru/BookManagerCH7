//
//  FiltersView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 4/8/26.
//

import SwiftUI

struct FiltersView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Select a genre")){
                    Picker("Genre", selection: $selectedGenre){
                        Text("No genre selected").tag(nil as Genre?)
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                Section(header:Text("Select a reading status")){
                    Picker("Reading status", selection: $selectedReadingStatus){
                        Text("No status selected").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id:\.self){ rs in
                            Text(rs.rawValue).tag(rs)
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Filter this").font(.headline)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Clear"){
                        self.selectedGenre = nil
                        self.selectedReadingStatus = nil
                    }
                }
                
            }
//            .navigationTitle("Apply filters")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: Button("Clear"){
//                self.selectedGenre = nil
//                self.selectedReadingStatus = nil
//            })
        }
    }
}
