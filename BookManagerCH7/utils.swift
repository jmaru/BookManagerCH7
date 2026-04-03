//
//  utils.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 4/2/26.
//

func filterFavoriteBooks(
    books: [Book],
) -> [Book] {
    return books.filter{
        $0.isFavorite
    }
}
