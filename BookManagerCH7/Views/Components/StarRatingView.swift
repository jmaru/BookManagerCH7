//
//  StarRatingView.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 3/25/26.
//

import SwiftUI

enum StarRatingStyle {
    case normal
    case compact
}

struct StarRatingView: View {
    var rating: Int // 3
    var style: StarRatingStyle = .normal
    
    var body: some View {
        
        HStack(spacing: style == .normal ? 10 : 5){
            ForEach(1...5, id: \.self){ number in // 5
                Image(systemName: number <= self.rating ? "star.fill" : "star")
                    .font(.title3)
                    .foregroundColor(.yellow)
            }
        }
    }
}
