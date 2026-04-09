//
//  utils.swift
//  BookManagerCH7
//
//  Created by Arturo Martinez on 4/4/26.
//



func filterFavoriteBooks(
    books:[Book],
    genre:Genre? = nil,
    readingStatus:ReadingStatus? = nil
)->[Book]{
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre
        ) && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
        
    }
}
