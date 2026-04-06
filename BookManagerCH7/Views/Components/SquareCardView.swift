//
//  SquareCardView.swift
//  BookManagerCH7
//
//  Created by Arturo Martinez on 4/4/26.
//

import SwiftUI

struct SquareCardView:View {
    
    var book: Book
    
    var body: some View {
        VStack{
            Text(book.title)
                .frame(maxWidth:.infinity)
                .font(.headline)
                .foregroundStyle(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.clear,.black.opacity(0.8)],
                    startPoint: .bottom,
                    endPoint: .top
                ))
            
            Spacer()
            
            Text(book.author)
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(.white)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .padding()
                .background(LinearGradient(
                    colors: [.clear,.black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
        }
        .frame(width:.infinity,height: .infinity)
        .background(
            Image(book.cover)
                .resizable()
                .scaledToFill()
        )
        .aspectRatio(1,contentMode: .fit)
        .cornerRadius(12)
    }
}


