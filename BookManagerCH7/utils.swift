//
//  utils.swift
//  BookManagerCH7
//
//  Created by Arturo Martinez on 4/4/26.
//



func filterFavoriteBooks(book:[Book])->[Book]{

    return book.filter{
        $0.isFavorite
    }
    
}
