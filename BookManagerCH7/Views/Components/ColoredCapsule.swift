//
//  ColoredCapsule.swift
//  BookManagerCH7
//
//  Created by Jorge Gabriel Marin Urias on 4/6/26.
//

import SwiftUI

struct ColoredCapsule: View{
    var text: String
    var color: Color = Color.accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
